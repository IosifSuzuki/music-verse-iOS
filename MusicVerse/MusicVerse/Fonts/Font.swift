//
//  Font.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 29.06.2023.
//

import Foundation
import CoreText

enum FontFailure: Error {
  case resourcePathForBundleNil
  case registrationFail(String)
  case creationFailed(String)
  case dataNotLoaded(String)
  case notFound(String)
}

struct Font {
  private enum Extensions: String, CaseIterable {
    case otf
    case ttf
  }
  
  let name: String
  let `extension`: String
  
  init?(fileName: String) {
    if fileName.contains(Font.Extensions.otf.rawValue) || fileName.contains(Font.Extensions.ttf.rawValue) {
      let components = fileName
        .split { $0 == "."}
        .map(String.init)
      
      if components.count == 2 {
        self.name = components[0]
        self.extension = components[1]
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
  
  static func registerModuleFonts() throws {
    try searchAvailableFontsInBundle()
      .forEach {
        try registerFont(bundle: Bundle.main, font: $0)
      }
  }
  
  // MARK: - Private
  
  private static func searchAvailableFontsInBundle() throws -> [Font] {
    if let fontFolderPath = Bundle.main.resourcePath {
      let fileManager = FileManager.default
      let files = try fileManager.contentsOfDirectory(atPath: fontFolderPath)
      
      let fonts = files
        .compactMap(Font.init)
      return fonts
    } else {
      throw FontFailure.resourcePathForBundleNil
    }
  }
  
  private static func registerFont(
    bundle: Bundle,
    font: Font
  ) throws {
    
    if let fontURL = bundle.url(forResource: font.name, withExtension: font.extension) {
      if let fontDataProvider = CGDataProvider(url: fontURL as CFURL) {
        if let cgfont = CGFont(fontDataProvider) {
          var error: Unmanaged<CFError>?
          let success = CTFontManagerRegisterGraphicsFont(cgfont, &error)
          if success {
            
          } else {
            throw FontFailure.registrationFail(
              error?.takeUnretainedValue().localizedDescription ?? "CTFontManagerRegisterGraphicsFont failed for \(font.name)"
            )
          }
        } else {
          throw FontFailure.creationFailed(font.name)
        }
      } else {
        throw FontFailure.dataNotLoaded(font.name)
      }
    } else {
      throw FontFailure.notFound(font.name)
    }
  }
  
}
