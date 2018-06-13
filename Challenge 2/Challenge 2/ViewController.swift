//
//  ViewController.swift
//  Challenge 2
//
//  Created by Felix Lin on 6/12/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  var flags = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Flag Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)
    
    for item in items {
      if item.contains(".png") {
        let replaced = item.replacingOccurrences(of: ".png", with: "")
        flags.append(replaced)
      }
    }
    print(flags)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return flags.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
    cell.textLabel?.text = flags[indexPath.row].uppercased()
    cell.imageView?.image = UIImage(named: flags[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.selectedImage = flags[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
