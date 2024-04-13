//
//  AudioPlayerManager.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import AVFoundation
import Combine

protocol AudioPlayerDelegate: AnyObject {
  func readyToPlayPlayerItem(with preloadInfo: AudioPreloadInfo)
  func failToPlayPlayerItem(with error: AudioPlayerError)
  func playerItemDidUpdate(currentTimeInSeconds: TimeInterval)
}

class AudioPlayerManager {
  
  weak var delegate: AudioPlayerDelegate?
  var isPlaying: Bool {
    avPlayer.timeControlStatus == .playing
  }
  
  private let avPlayer = AVPlayer()
  private var playerItem: AVPlayerItem?
  private(set) var currentTime: CMTime?
  
  private var cancellable: Set<AnyCancellable> = []
  private var timeObserver: Any?
  
  // MARK: - Public
  
  func playMedia(at url: URL) {
    let asset = AVAsset(url: url)
    let playerItem = AVPlayerItem(
      asset: asset,
      automaticallyLoadedAssetKeys: [.duration, .commonMetadata]
    )
    self.playerItem = playerItem
    self.subscribeToObservers()
    
    avPlayer.replaceCurrentItem(with: playerItem)
  }
  
  func play() {
    avPlayer.play()
  }
  
  func pause() {
    avPlayer.pause()
  }
  
  func stop() {
    avPlayer.pause()
    unsubscribeFromObservers()
  }
  
  func jumpForward(on seconds: TimeInterval) async {
    guard let playerItem else {
      return
    }
    await seek(to: min(playerItem.currentTime().seconds + seconds, playerItem.duration.seconds))
  }
  
  func jumpBackward(on seconds: TimeInterval) async {
    guard let playerItem else {
      return
    }
    await seek(to: max(0, playerItem.currentTime().seconds - seconds))
  }
  
  func seek(to timeInterval: TimeInterval) async {
    let time = CMTime(seconds: timeInterval, preferredTimescale: 600)
    await avPlayer.seek(to: time)
  }
  
  func activateAudioSession() {
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback)
      try AVAudioSession.sharedInstance().setActive(true)
    } catch {
      fatalError("Unfortunately got error while setup AudioSession \(error)")
    }
  }
  
  func deactivateAudioSession() {
    do {
      try AVAudioSession.sharedInstance().setActive(false)
    } catch {
      fatalError("Unfortunately got error while deactivate AudioSession \(error)")
    }
  }
  
}

private extension AudioPlayerManager {
  func subscribeToObservers() {
    playerItem?.publisher(for: \.status)
      .removeDuplicates()
      .sink { [weak self] status in
        guard let self else {
          return
        }
        switch status {
        case .readyToPlay:
          let duration = self.avPlayer.currentItem?.duration.seconds ?? .zero
          let preloadInfo = AudioPreloadInfo(durationInSeconds: duration)
          self.delegate?.readyToPlayPlayerItem(with: preloadInfo)
        case .failed:
          self.delegate?.failToPlayPlayerItem(with: .failToPlay)
        default:
          break
        }
      }
      .store(in: &cancellable)
    addPeriodicTimeObserver()
  }
  
  func unsubscribeFromObservers() {
    cancellable = []
    removePeriodicTimeObserver()
  }
  
  func addPeriodicTimeObserver() {
    let interval = CMTime(value: 1, timescale: 2)
    timeObserver = avPlayer.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
      guard let self else {
        return
      }
      currentTime = time
      self.delegate?.playerItemDidUpdate(currentTimeInSeconds: time.seconds)
    }
  }
  
  func removePeriodicTimeObserver() {
    guard let timeObserver else { return }
    avPlayer.removeTimeObserver(timeObserver)
    self.timeObserver = nil
  }
}
