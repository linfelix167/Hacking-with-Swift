//
//  Player.swift
//  Project 34 Four in a Row
//
//  Created by Felix Lin on 8/3/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit
import GameplayKit

class Player: NSObject, GKGameModelPlayer {

  var chip: ChipColor
  var color: UIColor
  var name: String
  var playerId: Int
  
  static var allPlayers = [Player(chip: .red), Player(chip: .black)]
  
  var opponent: Player {
    if chip == .red {
      return Player.allPlayers[1]
    } else {
      return Player.allPlayers[0]
    }
  }
  
  init(chip: ChipColor) {
    self.chip = chip
    self.playerId = chip.rawValue
    
    if chip == .red {
      color = .red
      name = "Red"
    } else {
      color = .black
      name = "Black"
    }
    
    super.init()
  }
}
