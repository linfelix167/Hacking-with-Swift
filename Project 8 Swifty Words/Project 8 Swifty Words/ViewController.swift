//
//  ViewController.swift
//  Project 8 Swifty Words
//
//  Created by Felix Lin on 6/25/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var cluesLabel: UILabel!
  @IBOutlet weak var answersLabel: UILabel!
  @IBOutlet weak var currentAnswer: UITextField!
  @IBOutlet weak var scoreLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func submitTapped(_ sender: UIButton) {
  }
  
  @IBAction func clearTapped(_ sender: UIButton) {
  }
}

