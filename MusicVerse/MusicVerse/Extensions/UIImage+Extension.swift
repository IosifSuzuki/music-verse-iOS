//
//  UIImage+Extension.swift
//  MusicVerse
//
//  Created by Bogdan Petkanych on 13.04.2024.
//

import UIKit.UIImage

extension UIImage {
  
  static func ovalIcon(with fillColor: UIColor, size: CGSize) -> UIImage {
    let renderFormat = UIGraphicsImageRendererFormat()
    renderFormat.opaque = false
    let rect = CGRect(origin: .zero, size: size)
    
    return UIGraphicsImageRenderer(size: size, format: renderFormat).image { context in
      let drawPath = UIBezierPath(ovalIn: rect)
      context.cgContext.setFillColor(fillColor.cgColor)
      context.cgContext.addPath(drawPath.cgPath)
      context.cgContext.drawPath(using: .fill)
    }
  }
  
}
