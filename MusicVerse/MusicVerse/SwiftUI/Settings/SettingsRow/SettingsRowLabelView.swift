//
//  SettingsRowLabelView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 06.07.2024.
//

import SwiftUI

struct SettingsRowLabelView: View {
  let model: SettingsRowLabelModel
  
  var body: some View {
    HStack(alignment: .center) {
      Text(model.title)
        .appFont(family: .app, style: .medium, size: 16)
        .foregroundColor(Asset.Colors.title.swiftUIColor)
      Spacer()
      Text(model.value)
        .appFont(family: .app, style: .regular, size: 16)
        .foregroundColor(Asset.Colors.subtitle.swiftUIColor)
    }
  }
}

#Preview {
  let model = SettingsRowLabelModel(title: "Version", value: "1")
  return SettingsRowLabelView(model: model)
}
