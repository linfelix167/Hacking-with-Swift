//
//  ViewController.swift
//  Challenge 3
//
//  Created by Felix Lin on 6/24/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var shoppingList = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
  }
  
  @objc func addItem() {
    let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
    ac.addTextField()
    let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned self, ac] (action) in
      let item = ac.textFields![0]
      self.submit(item: item.text!)
    }
    ac.addAction(submitAction)
    present(ac, animated: true)
  }
  
  func submit(item: String) {
    
    if item.isEmpty == false {
      shoppingList.insert(item, at: 0)
      let indexPath = IndexPath(row: 0, section: 0)
      tableView.insertRows(at: [indexPath], with: .automatic)
    } else {
      let ac = UIAlertController(title: "Empty", message: "Item is empty!", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .default))
      present(ac, animated: true)
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
    cell.textLabel?.text = shoppingList[indexPath.row]
    return cell
  }
}

