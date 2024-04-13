//
//  UIView+Extension.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import UIKit

extension UIView {
  
  static func loadFromNib() -> Self {
    let nibName = String(describing: self)
    guard let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil).first as? Self else {
      fatalError("couldn't found nib by name \(nibName)")
    }
    return view
  }
  
}
