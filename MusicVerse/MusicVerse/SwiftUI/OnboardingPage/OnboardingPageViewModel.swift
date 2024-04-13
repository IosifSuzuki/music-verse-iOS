//
//  OnboardingPageViewModel.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import Foundation
import Combine

class OnboardingPageViewModel: ObservableObject {
  @Published var title: String
  @Published var subtitle: String
  
  init(title: String, subtitle: String) {
    self.title = title
    self.subtitle = subtitle
  }
}
