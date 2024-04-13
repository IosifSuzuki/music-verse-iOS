//
//  UIStoryboard+Extension.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import UIKit

extension UIStoryboard {
  
  static func initialViewController<T: UIViewController>() -> T {
    var name = String(describing: T.self)
    if let vcSuffix = name.range(of: "ViewController") {
      name.removeSubrange(vcSuffix)
    }
    guard let viewController = UIStoryboard(name: name, bundle: .main).instantiateInitialViewController() as? T else {
      fatalError("can't initialize view controller from storyaboard \(name)")
    }
    return viewController
  }
  
}
