//
//  ViewController.swift
//  Project 7 Whitehouse Petitions
//
//  Created by Felix Lin on 6/25/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var petitions = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return petitions.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = "Title goes here"
    cell.detailTextLabel?.text = "Subtitle goes here"
    return cell
  }
}

