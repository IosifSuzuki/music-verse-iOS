//
//  AppFont.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 29.06.2023.
//

import SwiftUI

extension View {
  func appFont(
    family: FontFamily,
    style: FontStyle = .regular,
    size: CGFloat
  ) -> some View {
    self
      .modifier(
        AppFont(
          name: family.fontFor(style: style).rawValue,
          size: size
        )
      )
  }
}

struct AppFont: ViewModifier {
  
  let name: String
  let size: CGFloat
  
  func body(content: Content) -> some View {
    content
      .font(
        .custom(name, size: size)
      )
  }
}
