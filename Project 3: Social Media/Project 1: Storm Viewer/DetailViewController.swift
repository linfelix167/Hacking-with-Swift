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
    
    title = selectedImage
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }
  
  @objc func shareTapped() {
    let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
  
  override func prefersHomeIndicatorAutoHidden() -> Bool {
    return navigationController?.hidesBarsOnTap ?? false
  }
}
