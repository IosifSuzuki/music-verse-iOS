//
//  AudioPlayerViewController.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import UIKit

final class AudioPlayerViewController: BaseViewController<AudioPlayerViewModel> {
  
  @IBOutlet private weak var playbackView: PlaybackView!
  
  // MARK: - Life cycle
  
  override func setupUI() {
    super.setupUI()
    
    playbackView.playPauseClosure = { [weak self] in
      self?.viewModel.playPause()
    }
    playbackView.forwardClosure = { [weak self] in
      self?.viewModel.seekForward()
    }
    playbackView.backwardClosure = { [weak self] in
      self?.viewModel.seekBackward()
    }
    viewModel.startToPlayMedia()
  }
  
  override func bindViewModel() {
    super.bindViewModel()
    
    viewModel
      .$trackName
      .receive(on: RunLoop.main)
      .assign(to: \.text, on: playbackView.titleLabel)
      .store(in: &cancellable)
    viewModel
      .$playingTime
      .receive(on: RunLoop.main)
      .assign(to: \.text, on: playbackView.playingTimeLabel)
      .store(in: &cancellable)
    viewModel
      .$remainingTime
      .receive(on: RunLoop.main)
      .assign(to: \.text, on: playbackView.remainingTimeLabel)
      .store(in: &cancellable)
    viewModel
      .$progressPlayer
      .receive(on: RunLoop.main)
      .assign(to: \.value, on: playbackView.playerSlider)
      .store(in: &cancellable)
    viewModel
      .$playerStatus
      .receive(on: RunLoop.main)
      .map { playerStatus -> UIImage? in
        switch playerStatus {
        case .pause:
          UIImage(systemName: "pause.fill")
        case .playing:
          UIImage(systemName: "play.fill")
        default:
          nil
        }
      }
      .sink { [weak self] icon in
        self?.playbackView.playPauseButton.setImage(icon, for: .normal)
      }.store(in: &cancellable)
  }
  
  // MARK: - Initializing
  
  static func initialize(with audio: Audio, playerManager: AudioPlayerManager) -> AudioPlayerViewController {
    let viewModel = AudioPlayerViewModel(audio: audio, playerManager: playerManager)
    let viewController: AudioPlayerViewController = AudioPlayerViewController.initialize()
    viewController.viewModel = viewModel
    
    return viewController
  }
  
}

private extension AudioPlayerViewController {
  
}
