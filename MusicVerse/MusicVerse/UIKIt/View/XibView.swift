//
//  BaseUIView.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 10.03.2024.
//

import UIKit

class XibView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    commonInit()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setupView()
  }
  
  func commonInit() {
    let rootView = loadNib()
    addSubview(rootView)
  }
  
  func setupView() {
    
  }
  
  func loadNib() -> UIView {
    let nibName = String(describing: type(of: self))
    let bundle = Bundle(for: type(of: self))
    guard let view = UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: self).first as? UIView else {
      fatalError("couldn't find nib by name \(nibName)")
    }
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.frame = bounds
    return view
  }
  
}
