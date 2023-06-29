//
//  ContentView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import SwiftUI

struct ContentView: View {
  
  var viewModels: [OnboardingPageViewModel] = [
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
  
  var body: some View {
    ZStack {
      Asset.Colors.background.swiftUIColor
        .ignoresSafeArea()
      NavigationView {
        VStack {
          TabView {
            ForEach(0..<viewModels.count, id: \.self) { idx in
              OnboardingPageView(viewModel: viewModels[idx])
            }
          }
          .tabViewStyle(.page)
          Button {
            //TODO
          } label: {
            Text(L10n.continue)
              .appFont(family: .app, style: .medium, size: 20)
              .foregroundColor(Asset.Colors.title.swiftUIColor)
              .padding(.init(top: 10, leading: 8, bottom: 10, trailing: 10))
              .frame(maxWidth: .infinity)
              .background(Asset.Colors.focus.swiftUIColor)
              .cornerRadius(8)
          }
          .padding()
        }
        .padding(.vertical)
        .toolbar(content: {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(L10n.skip) {
              
            }
            .foregroundColor(Asset.Colors.title.swiftUIColor)
          }
        })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
