//
//  ViewController.swift
//  Project 38 GitHub Commits
//
//  Created by Felix Lin on 8/21/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
  
  var container: NSPersistentContainer!
  var commits = [Commit]()
  var commitPredicate: NSPredicate?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(changeFilter))
    
    container = NSPersistentContainer(name: "Project38")
    container.loadPersistentStores { (storeDescription, error) in
      
      self.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
      
      if let error = error {
        print("Unsolved error \(error)")
      }
    }
    
    performSelector(inBackground: #selector(fetchCommits), with: nil)
  }
  
  @objc func changeFilter() {
    let ac = UIAlertController(title: "Filter commits...", message: nil, preferredStyle: .actionSheet)
    
    ac.addAction(UIAlertAction(title: "Show only fixes", style: .default, handler: { [unowned self] (_) in
      self.commitPredicate = NSPredicate(format: "message CONTAINS[c] 'fix'")
      self.loadSavedData()
    }))
    
    ac.addAction(UIAlertAction(title: "Ignore Pull Requests", style: .default, handler: { [unowned self] (_) in
      self.commitPredicate = NSPredicate(format: "NOT message BEGINSWITH 'Merge pull request'")
      self.loadSavedData()
    }))
    
    ac.addAction(UIAlertAction(title: "Show only recent", style: .default, handler: { [unowned self] (_) in
      let twelveHoursAgo = Date().addingTimeInterval(-43200)
      self.commitPredicate = NSPredicate(format: "date > %@", twelveHoursAgo as NSDate)
      self.loadSavedData()
    }))
    
    ac.addAction(UIAlertAction(title: "Show all commits", style: .default, handler: { [unowned self] (_) in
      self.commitPredicate = nil
      self.loadSavedData()
    }))
    
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(ac, animated: true)
  }

  func saveContext() {
    if container.viewContext.hasChanges {
      do {
        try container.viewContext.save()
      } catch {
        print("An error occured while saving: \(error)")
      }
    }
  }
  
  @objc func fetchCommits() {
    if let data = try? String(contentsOf: URL(string: "https://api.github.com/repos/apple/swift/commits?per_page=100")!) {
      let jsonCommits = JSON(parseJSON: data)
      let jsonCommitArray = jsonCommits.arrayValue
      
      print("Received \(jsonCommitArray.count) new commits.")
      
      DispatchQueue.main.async { [unowned self] in
        for jsonCommit in jsonCommitArray {
          let commit = Commit(context: self.container.viewContext)
          self.configure(commit: commit, usingJSON: jsonCommit)
        }
        
        self.saveContext()
      }
    }
  }

  func configure(commit: Commit, usingJSON json: JSON) {
    commit.sha = json["sha"].stringValue
    commit.message = json["commit"]["message"].stringValue
    commit.url = json["html_url"].stringValue
    
    let formatter = ISO8601DateFormatter()
    commit.date = formatter.date(from: json["commit"]["committer"]["date"].stringValue) ?? Date()
  }
  
  func loadSavedData() {
    let request = Commit.createFetchRequest()
    let sort = NSSortDescriptor(key: "date", ascending: false)
    request.sortDescriptors = [sort]
    request.predicate = commitPredicate
    
    do {
      commits = try container.viewContext.fetch(request)
      print("Got \(commits.count) commits")
      tableView.reloadData()
    } catch {
      print("Fetch failed")
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return commits.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Commit", for: indexPath)
    
    let commit = commits[indexPath.row]
    cell.textLabel?.text = commit.message
    cell.detailTextLabel?.text = commit.date.description
    return cell
  }
}

