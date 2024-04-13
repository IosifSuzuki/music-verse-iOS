//
//  AppRootManager.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import Foundation

final class AppRootManager: ObservableObject {
  @Published var currentRoot: eAppRoots = .onboarding
  
  enum eAppRoots {
    case onboarding
    case main
  }
}
