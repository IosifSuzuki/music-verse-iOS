//
//  Date+Extension.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 06.07.2024.
//

import Foundation

extension Date {
  func string(dateFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    return dateFormatter.string(from: self)
  }
}
