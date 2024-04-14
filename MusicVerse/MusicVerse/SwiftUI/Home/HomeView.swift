//
//  HomeView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 14.04.2024.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    TabView {
      NavigationStack {
        AudioPlayerRepresentable()
          .ignoresSafeArea(.container, edges: .top)
      }.tabItem {
        Label("Test player", systemImage: "music.note")
      }
      Text("Playlist list")
        .tabItem {
          Label(L10n.HomeView.Playlists.title, systemImage: "tray.full")
        }
      Text("Folders list")
        .tabItem {
          Label(L10n.HomeView.Folders.title, systemImage: "folder")
        }
      Text("Settings content")
        .tabItem {
          Label(L10n.HomeView.Settings.title, systemImage: "gearshape")
        }
    }.tint(Asset.Colors.focus.swiftUIColor)
  }
}

#Preview {
  HomeView()
}
