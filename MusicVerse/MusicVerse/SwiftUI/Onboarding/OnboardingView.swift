//
//  OnboardingView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanitch on 28.06.2023.
//

import SwiftUI

struct OnboardingView: View {
  
  @ObservedObject var viewModel: OnboardingViewModel
  
  @EnvironmentObject private var appRootManager: AppRootManager
  @State var selectedTab: Int = .zero
  
  init(viewModel: OnboardingViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    ZStack {
      Asset.Colors.background.swiftUIColor
        .ignoresSafeArea()
      NavigationView {
        VStack {
          TabView(selection: $viewModel.currentPage) {
            ForEach(viewModel.dataSource.indices, id: \.self) { idx in
              OnboardingPageView(viewModel: viewModel.dataSource[idx])
            }
          }
          .tabViewStyle(.page)
          Button {
            viewModel.continueBrowsing()
          } label: {
            Text(viewModel.bottomButtonTitle)
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
            Button(viewModel.rightButtonTitle) {
              viewModel.finishOnboarding()
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
    let appRootManager = AppRootManager()
    let viewModel = OnboardingViewModel(appRootManager: appRootManager)
    return OnboardingView(viewModel: viewModel)
  }
}
