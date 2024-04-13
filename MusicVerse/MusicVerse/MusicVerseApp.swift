//
//  MusicVerseApp.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import SwiftUI

@main
struct MusicVerseApp: App {
  
  @StateObject private var appRootManager = AppRootManager()
  
  init() {
    do {
      try Font.registerModuleFonts()
    } catch {
      preconditionFailure(error.localizedDescription)
    }
  }
  var body: some Scene {
    WindowGroup {
      Group {
        switch appRootManager.currentRoot {
        case .onboarding:
          ContentView()
        case .main:
          AudioPlayerRepresentable()
            .ignoresSafeArea()
        }
      }
      .environmentObject(appRootManager)
    }
  }
}
