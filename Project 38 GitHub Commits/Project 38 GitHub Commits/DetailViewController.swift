//
//  DetailViewController.swift
//  Project 38 GitHub Commits
//
//  Created by Felix Lin on 8/22/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailLabel: UILabel!
  
  var detailItem: Commit?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let detail = self.detailItem {
      detailLabel.text = detail.message
//      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
    }
  }
}
