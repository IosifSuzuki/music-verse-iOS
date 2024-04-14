//
//  AudioPlayerViewModel.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 12.04.2024.
//

import Foundation

class AudioPlayerViewModel: BaseViewModel {
  
  @Published var trackName: String?
  @Published var playingTime: String?
  @Published var remainingTime: String?
  @Published var progressPlayer: Float = .zero
  @Published var playerStatus: PlayerStatus?
  
  private let playerManager: AudioPlayerManager
  private let audio: Audio
  
  private var playerItemDurationInSeconds: TimeInterval?
  
  init(audio: Audio, playerManager: AudioPlayerManager) {
    self.playerManager = playerManager
    self.audio = audio
    super.init()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    trackName = audio.title
    backgroundColor = PaletteColor.color(for: audio.title)
  }
  
  func startToPlayMedia() {
    playerManager.delegate = self
    playerManager.activateAudioSession()
    playerManager.playMedia(at: audio.source)
  }
  
  func seekForward() {
    Task {
      await playerManager.jumpForward(on: 15)
    }
  }
  
  func seekBackward() {
    Task {
      await playerManager.jumpBackward(on: 15)
    }
  }
  
  func playPause() {
    let playerStatus: PlayerStatus = playerManager.isPlaying ? .playing : .pause
    self.playerStatus = playerStatus
    switch playerStatus {
    case .playing:
      playerManager.pause()
    case .pause:
      playerManager.play()
    }
  }
  
}

extension AudioPlayerViewModel: AudioPlayerDelegate {
  
  func playerItemDidUpdate(currentTimeInSeconds: TimeInterval) {
    guard let playerItemDurationInSeconds else {
      return
    }
    let timeInSeconds = Int(currentTimeInSeconds.rounded())
    let remainingTimeInSeconds = Int(playerItemDurationInSeconds.rounded()) - timeInSeconds
    progressPlayer = Float(currentTimeInSeconds / playerItemDurationInSeconds)
    playingTime = TimeFormatter.playbackTime(seconds: timeInSeconds)
    remainingTime = "-\(TimeFormatter.playbackTime(seconds: remainingTimeInSeconds))"
  }
  
  func readyToPlayPlayerItem(with preloadInfo: AudioPreloadInfo) {
    playerItemDurationInSeconds = preloadInfo.durationInSeconds
    playerStatus = .pause
    playerManager.play()
  }
  
  func failToPlayPlayerItem(with error: AudioPlayerError) {
    playerStatus = .pause
  }
}
