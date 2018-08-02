//
//  Whistle.swift
//  Project 33  What's that Whistle?
//
//  Created by Felix Lin on 8/2/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import CloudKit
import UIKit

class Whistle: NSObject {
  var recordID: CKRecordID!
  var genre: String!
  var comments: String!
  var audio: URL!
}
