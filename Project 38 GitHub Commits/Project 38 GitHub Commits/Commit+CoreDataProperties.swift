//
//  Commit+CoreDataProperties.swift
//  Project 38 GitHub Commits
//
//  Created by Felix Lin on 8/22/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//
//

import Foundation
import CoreData


extension Commit {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Commit> {
        return NSFetchRequest<Commit>(entityName: "Commit")
    }

    @NSManaged public var date: Date
    @NSManaged public var message: String
    @NSManaged public var sha: String
    @NSManaged public var url: String

}
