//
//  AppInfo.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 06.07.2024.
//

import Foundation

struct AppInfo {
  private var buildEnvironment: [String: Any] {
    Bundle.main.object(forInfoDictionaryKey: "BuildEnvironment") as? [String: Any] ?? [:]
  }
  var name: String? {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
  }
  
  var version: String? {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
  }
  
  var buildNumber: String? {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
  }
  
  var buildDate: Date? {
    guard let timestampString = buildEnvironment["BuildTimestamp"] as? String else {
      return nil
    }
    guard let timestampValue = Double(timestampString) else {
      return nil
    }
    return Date(timeIntervalSince1970: timestampValue)
  }
}
