//
//  TimeFormatter.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 13.04.2024.
//

import Foundation

class TimeFormatter {
  
  static func playbackTime(seconds: Int) -> String {
    Duration.seconds(seconds).formatted(.time(pattern: .minuteSecond))
  }
  
}
