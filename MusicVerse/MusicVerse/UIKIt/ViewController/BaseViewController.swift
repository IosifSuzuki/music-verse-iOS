//
//  BaseViewController.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 12.04.2024.
//

import UIKit
import Combine

class BaseViewController<VM: BaseViewModel>: UIViewController {
  
  var viewModel: VM!
  var cancellable: Set<AnyCancellable> = []
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.viewDidLoad()
    setupUI()
    bindViewModel()
  }
  
  func setupUI() {
    
  }
  
  func bindViewModel() {
    viewModel
      .$title
      .receive(on: RunLoop.main)
      .assign(to: \.title, on: self)
      .store(in: &cancellable)
    viewModel
      .$backgroundColor
      .receive(on: RunLoop.main)
      .assign(to: \.backgroundColor, on: view)
      .store(in: &cancellable)
  }
  
  // MARK: - Initializing
  
  class func initialize() -> Self {
    let viewController = UIStoryboard.initialViewController() as Self
    return viewController
  }
  
}
