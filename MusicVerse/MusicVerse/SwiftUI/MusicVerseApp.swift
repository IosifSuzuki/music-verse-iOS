//
//  MusicVerseApp.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import SwiftUI

@main
struct MusicVerseApp: App {
  
  @ObservedObject var appRootManager: AppRootManager
  let onboardingViewModel: OnboardingViewModel
  
  init() {
    let appRootManager = AppRootManager()
    self.onboardingViewModel = OnboardingViewModel(appRootManager: appRootManager)
    self.appRootManager = appRootManager

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
          OnboardingView(viewModel: onboardingViewModel)
        case .home:
          HomeView()
        }
      }
      .environmentObject(appRootManager)
    }
  }
}
