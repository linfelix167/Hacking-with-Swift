//
//  CardViewController.swift
//  Project 37  Psychic Tester
//
//  Created by Felix Lin on 8/6/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
  
  weak var delegate: ViewController!
  
  var front: UIImageView!
  var back: UIImageView!
  var isCorrect = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.bounds = CGRect(x: 0, y: 0, width: 100, height: 140)
    front = UIImageView(image: UIImage(named: "cardBack"))
    back = UIImageView(image: UIImage(named: "cardBack"))
    
    view.addSubview(front)
    view.addSubview(back)
    
    front.isHidden = true
    back.alpha = 0
    
    UIView.animate(withDuration: 0.2) {
      self.back.alpha = 1
    }
  }
  
}
