//
//  Commit+CoreDataClass.swift
//  Project 38 GitHub Commits
//
//  Created by Felix Lin on 8/24/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Commit)
public class Commit: NSManagedObject {

  override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
    super.init(entity: entity, insertInto: context)
    print("Init called!")
  }
}
