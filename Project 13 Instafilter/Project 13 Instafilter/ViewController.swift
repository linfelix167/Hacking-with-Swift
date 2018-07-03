//
//  ViewController.swift
//  Project 13 Instafilter
//
//  Created by Felix Lin on 7/2/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var intensity: UISlider!
  
  var currentImage: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "YACIFP"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
  }
  
  @objc func importPicture() {
    let picker = UIImagePickerController()
    picker.allowsEditing = true
    picker.delegate = self
    present(picker, animated: true)
  }

  @IBAction func changeFilter(_ sender: Any) {
  }
  
  @IBAction func save(_ sender: Any) {
  }
  
  @IBAction func intensityChanged(_ sender: Any) {
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
    dismiss(animated: true)
    currentImage = image
  }
  
}

