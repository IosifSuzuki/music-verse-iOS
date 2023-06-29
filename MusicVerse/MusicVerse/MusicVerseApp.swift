//
//  MusicVerseApp.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import SwiftUI

@main
struct MusicVerseApp: App {
  
  init() {
    do {
      try Font.registerModuleFonts()
    } catch {
      preconditionFailure(error.localizedDescription)
    }
  }
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
