//
//  AudioPlayerRepresentable.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import SwiftUI

struct AudioPlayerRepresentable: UIViewControllerRepresentable {
  
  func makeUIViewController(context: Context) -> AudioPlayerViewController {
    let audioPlayerManager = AudioPlayerManager()
    let sourceURL: URL! = Bundle.main.url(forResource: "test", withExtension: "mp3")
    let audio = Audio(title: "test.mp3", source: sourceURL)
    let viewController = AudioPlayerViewController.initialize(with: audio, playerManager: audioPlayerManager)
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: AudioPlayerViewController, context: Context) { }
  
}
