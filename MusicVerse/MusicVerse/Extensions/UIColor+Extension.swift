//
//  UIColor+Extension.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 11.03.2024.
//

import UIKit

extension UIColor {
  
  var inverted: UIColor {
    var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
    getRed(&r, green: &g, blue: &b, alpha: &a)
    return UIColor(red: (1 - r), green: (1 - g), blue: (1 - b), alpha: a)
  }
  
  convenience init?(hex: String) {
    let r, g, b, a: CGFloat
    
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])
      
      let scanner = Scanner(string: hexColor)
      var hexNumber: UInt64 = 0
      
      if hexColor.count == 8 {
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      } else if hexColor.count == 6 {
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
          g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
          b = CGFloat(hexNumber & 0x0000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: 1)
          return
        }
      }
      return nil
    }
    return nil
  }
}
