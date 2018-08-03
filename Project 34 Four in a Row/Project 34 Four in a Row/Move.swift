//
//  Move.swift
//  Project 34 Four in a Row
//
//  Created by Felix Lin on 8/3/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit
import GameplayKit

class Move: NSObject {

  var value: Int = 0
  var column: Int
  
  init(column: Int) {
    self.column = column
  }
}
