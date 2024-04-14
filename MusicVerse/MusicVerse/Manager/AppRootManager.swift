//
//  AppRootManager.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import Foundation

final class AppRootManager: ObservableObject {
  @Published private(set) var currentRoot: AppRoot
  
  init() {
    currentRoot = if UserDefaults.showOnboarding {
      .onboarding
    } else {
      .home
    }
  }
  
  func finishOnboarding() {
    currentRoot = .home
    UserDefaults.showOnboarding = false
  }
  
  enum AppRoot {
    case onboarding
    case home
  }
}
