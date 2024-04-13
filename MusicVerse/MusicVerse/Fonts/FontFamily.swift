//
//  FontFamily.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 29.06.2023.
//

import Foundation
import UIKit.UIFont

public enum FontName: String {
  case bold = "YsabeauOffice-Bold"
  case italic = "YsabeauOffice-Italic"
  case light = "YsabeauOffice-Light"
  case medium = "YsabeauOffice-Medium"
  case regular = "YsabeauOffice-Regular"
  
  func font(by size: CGFloat) -> UIFont {
    guard let font = UIFont(name: rawValue, size: size) else {
      fatalError("unknown font")
    }
    return font
  }
}

public enum FontStyle {
  case bold
  case italic
  case light
  case medium
  case regular
  
  var name: FontName {
    switch self {
    case .bold:
      return .bold
    case .italic:
      return .italic
    case .light:
      return .light
    case .medium:
      return .medium
    case .regular:
      return .regular
    }
  }
}

public struct FontFamily {
  
  let light: FontName
  let regular: FontName
  let italic: FontName
  let medium: FontName
  let bold: FontName
  
  func fontFor(style: FontStyle) -> FontName {
    return style.name
  }
}

extension FontFamily {
  static let app = FontFamily(
    light: .light,
    regular: .regular,
    italic: .italic,
    medium: .medium,
    bold: .bold
  )
}
