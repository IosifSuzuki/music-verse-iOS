//
//  SettingsView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 06.07.2024.
//

import SwiftUI

struct SettingsView: View {
  var viewModel: SettingsViewModel
  
  init(viewModel: SettingsViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    Form {
      ForEach(0..<viewModel.sections.count, id: \.self) { sectionIndex in
        let section = viewModel.sections[sectionIndex]
        Section {
          ForEach(0..<section.items.count, id: \.self) { index in
            let item = section.items[index]
            switch item {
            case let .label(model):
              SettingsRowLabelView(model: model)
            }
          }
        } header: {
          Text(viewModel.sections[sectionIndex].headerTitle)
            .appFont(family: .app, style: .medium, size: 18)
            .textCase(.none)
        }
      }
    }
    .navigationTitle(viewModel.title)
  }
}

#Preview {
  let viewModel = SettingsViewModel()
  return SettingsView(viewModel: viewModel)
}
