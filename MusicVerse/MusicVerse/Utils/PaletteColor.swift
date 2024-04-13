//
//  PaletteColor.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 13.04.2024.
//

import Foundation
import UIKit.UIColor

class PaletteColor {
  static func color(for text: String) -> UIColor? {
    guard let dataID = text.data(using: .utf8) else {
      return nil
    }
    
    let palette = [
      UIColor(hex: "#976B4E"),
      UIColor(hex: "#A09D8B"),
      UIColor(hex: "#807E6F"),
    ]
    
    let hashValue = dataID.reduce(Int(0)) { result, byte in
      result + Int(byte)
    }
    return palette[hashValue % palette.count]
  }
}
