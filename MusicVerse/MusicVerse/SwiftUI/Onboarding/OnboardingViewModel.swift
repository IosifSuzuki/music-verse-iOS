//
//  OnboardingViewModel.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 14.04.2024.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
  @Published var dataSource: [OnboardingPageViewModel]
  @Published var currentPage: Int
  @Published var bottomButtonTitle: String
  @Published var rightButtonTitle: String
  var cancellable: Set<AnyCancellable> = []
  
  let appRootManager: AppRootManager
  
  init(appRootManager: AppRootManager) {
    self.appRootManager = appRootManager
    currentPage = .zero
    bottomButtonTitle = L10n.continue
    rightButtonTitle = L10n.skip
    dataSource = [
      .init(
        title: L10n.OnboardingPage.FirstPage.title,
        subtitle: L10n.OnboardingPage.FirstPage.subtitle
      ),
      .init(
        title: L10n.OnboardingPage.SecondPage.title,
        subtitle: L10n.OnboardingPage.SecondPage.subtitle
      ),
      .init(
        title: L10n.OnboardingPage.ThirdPage.title,
        subtitle: L10n.OnboardingPage.ThirdPage.subtitle
      ),
      .init(
        title: L10n.OnboardingPage.FourthPage.title,
        subtitle: L10n.OnboardingPage.FourthPage.subtitle
      ),
    ]
    
    observeChanges()
  }
  
  func continueBrowsing() {
    let isLastPage = currentPage == dataSource.indices.last
    if isLastPage {
      finishOnboarding()
      return
    }
    currentPage += 1
    updateBottomButtonTitle(currentPage: currentPage)
  }
  
  func finishOnboarding() {
    appRootManager.finishOnboarding()
  }
}

private extension OnboardingViewModel {
  
  func observeChanges() {
    $currentPage.sink { [weak self] currentPage in
      self?.updateBottomButtonTitle(currentPage: currentPage)
    }.store(in: &cancellable)
  }
  
  func updateBottomButtonTitle(currentPage: Int) {
    let isLastPage = currentPage == dataSource.indices.last
    bottomButtonTitle = if isLastPage {
      L10n.finish
    } else {
      L10n.continue
    }
  }
  
}
