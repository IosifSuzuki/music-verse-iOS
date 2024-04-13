//
//  PlayerSlider.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 13.04.2024.
//

import UIKit

class PlayerSlider: UISlider {
  var onBeginTracking: (() -> Void)?
  var onEndTracking: (() -> Void)?
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    onBeginTracking?()
    return super.beginTracking(touch, with: event)
  }
  
  override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    onEndTracking?()
    super.endTracking(touch, with: event)
  }
  
  override func cancelTracking(with event: UIEvent?) {
    onEndTracking?()
    super.cancelTracking(with: event)
  }
}

