//
//  UserDefaults+Extension.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 14.04.2024.
//

import Foundation

extension UserDefaults {
  @Storage(key: "showOnboarding", defaultValue: true)
  static var showOnboarding: Bool
}
