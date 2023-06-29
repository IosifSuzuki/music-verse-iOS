//
//  OnboardingPageView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import SwiftUI

struct OnboardingPageView: View {
  
  var viewModel: OnboardingPageViewModel
  
  init(viewModel: OnboardingPageViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Text(viewModel.title)
        .appFont(family: .app, style: .medium, size: 22)
        .foregroundColor(Asset.Colors.title.swiftUIColor)
      Text(viewModel.subtitle)
        .appFont(family: .app, style: .regular, size: 20)
        .foregroundColor(Asset.Colors.subtitle.swiftUIColor)
        .multilineTextAlignment(.center)
        .padding()
    }
  }
}

struct OnboardingPageView_Previews: PreviewProvider {
  static var viewModel: OnboardingPageViewModel {
    return .init(
      title: L10n.OnboardingPage.FirstPage.title,
      subtitle: L10n.OnboardingPage.FirstPage.subtitle
    )
  }
    static var previews: some View {
      OnboardingPageView(viewModel: Self.viewModel)
        .preferredColorScheme(.light)
        .previewLayout(.device)
    }
}
