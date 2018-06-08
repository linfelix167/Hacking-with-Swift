//
//  DetailViewController.swift
//  Project 1: Storm Viewer
//
//  Created by Felix Lin on 6/8/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  
  var selectedImage: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
  }
}
