//
//  ViewController.swift
//  Project 33  What's that Whistle?
//
//  Created by Felix Lin on 8/1/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "What's that Whistle?"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhistle))
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
  }
  
  @objc func addWhistle() {
    let vc = RecordWhistleViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

