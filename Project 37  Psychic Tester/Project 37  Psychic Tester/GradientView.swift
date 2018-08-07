//
//  GradientView.swift
//  Project 37  Psychic Tester
//
//  Created by Felix Lin on 8/7/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
  
  @IBInspectable var topColor: UIColor = UIColor.white
  @IBInspectable var bottomColor: UIColor = UIColor.black
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
  
  override func layoutSubviews() {
    (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
  }
}
