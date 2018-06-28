//
//  GameScene.swift
//  Project 11: Pachinko
//
//  Created by Felix Lin on 6/28/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  override func didMove(to view: SKView) {
    let background = SKSpriteNode(imageNamed: "background.jpg")
    background.position = CGPoint(x: 512, y: 384)
    background.blendMode = .replace
    background.zPosition = -1
    addChild(background)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  }
}
