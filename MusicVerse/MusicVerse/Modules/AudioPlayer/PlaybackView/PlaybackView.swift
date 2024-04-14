//
//  PlaybackView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import UIKit

final class PlaybackView: XibView {
  @IBOutlet private(set) weak var titleLabel: UILabel!
  @IBOutlet private(set) weak var playingTimeLabel: UILabel!
  @IBOutlet private(set) weak var remainingTimeLabel: UILabel!
  @IBOutlet private(set) weak var playerSlider: PlayerSlider!
  @IBOutlet private(set) weak var backwardButton: UIButton!
  @IBOutlet private(set) weak var playPauseButton: UIButton!
  @IBOutlet private(set) weak var forwardButton: UIButton!
  
  var playPauseClosure: (() -> ())?
  var forwardClosure: (() -> ())?
  var backwardClosure: (() -> ())?
  
  // MARK: - Override
  
  override func setupView() {
    super.setupView()
    
    titleLabel.font = FontName.bold.font(by: 16)
    layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    layer.cornerRadius = 20
    playingTimeLabel.font = FontName.medium.font(by: 14)
    remainingTimeLabel.font = FontName.medium.font(by: 14)
    
    setupSliderAppearance()
  }
  
  // MARK: - Public interface
  
  private func setupSliderAppearance() {
    let thumbnailSize = CGSize(width: 12, height: 12)
    let thumbnailIcon = UIImage.ovalIcon(with: Asset.Colors.title.color, size: thumbnailSize)
    playerSlider.setThumbImage(thumbnailIcon, for: .normal)
  }
  
  // MARK: - Actions
  
  @IBAction func playPauseTapped(_ sender: UIControl) {
    playPauseClosure?()
  }
  
  @IBAction func backwardTapped(_ sender: UIControl) {
    backwardClosure?()
  }
  
  @IBAction func forwardTapped(_ sender: UIControl) {
    forwardClosure?()
  }
}
