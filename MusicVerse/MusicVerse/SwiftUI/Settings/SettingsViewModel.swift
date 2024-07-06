//
//  SettingsViewModel.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 06.07.2024.
//

import Foundation

class SettingsViewModel: ObservableObject {
  struct Section {
    let headerTitle: String
    let items: [Item]
  }
  enum Item {
    case label(SettingsRowLabelModel)
  }
  
  @Published var title: String
  @Published var sections: [Section]
  let appInfo = AppInfo()
  
  init() {
    title = L10n.HomeView.Settings.title
    
    var buildItems: [Item] = []
    if let buildVersion = appInfo.version {
      let buildVersionModel = SettingsRowLabelModel(title: L10n.Settings.BuildVersion.title, value: buildVersion)
      buildItems.append(.label(buildVersionModel))
    }
    if let buildNumber = appInfo.buildNumber {
      let buildNumberModel = SettingsRowLabelModel(title: L10n.Settings.BuildNumber.title, value: buildNumber)
      buildItems.append(.label(buildNumberModel))
    }
    if let buildDate = appInfo.buildDate?.string(dateFormat: "dd.MM.yy") {
      let buildDateModel = SettingsRowLabelModel(title: L10n.Settings.BuildDate.title, value: buildDate)
      buildItems.append(.label(buildDateModel))
    }
    let buildSection = Section(headerTitle: L10n.Settings.BuildInfo.title, items: buildItems)
    self.sections = [buildSection]
  }
}
