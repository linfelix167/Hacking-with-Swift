//
//  GameScene.swift
//  Project 11 Pachinko
//
//  Created by Felix Lin on 6/29/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
  
  var scoreLabel: SKLabelNode!
  var editLabel: SKLabelNode!
  
  var score: Int = 0 {
    didSet {
      scoreLabel.text = "Score: \(score)"
    }
  }
  
  var editingMode: Bool = false {
    didSet {
      if editingMode == true {
        editLabel.text = "Done"
      } else {
        editLabel.text = "Edit"
      }
    }
  }
  
  override func didMove(to view: SKView) {
    let background = SKSpriteNode(imageNamed: "background.jpg")
    background.position = CGPoint(x: 512, y: 384)
    background.blendMode = .replace
    background.zPosition = -1
    addChild(background)
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    physicsWorld.contactDelegate = self
    
    makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
    makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
    makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
    makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
    
    makeBouncerAt(position: CGPoint(x: 0, y: 0))
    makeBouncerAt(position: CGPoint(x: 256, y: 0))
    makeBouncerAt(position: CGPoint(x: 512, y: 0))
    makeBouncerAt(position: CGPoint(x: 768, y: 0))
    makeBouncerAt(position: CGPoint(x: 1024, y: 0))
    
    scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    scoreLabel.text = "Score: 0"
    scoreLabel.horizontalAlignmentMode = .right
    scoreLabel.position = CGPoint(x: 980, y: 700)
    addChild(scoreLabel)
    
    editLabel = SKLabelNode(fontNamed: "Chalkduster")
    editLabel.text = "Edit"
    editLabel.position = CGPoint(x: 80, y: 700)
    addChild(editLabel)
  }
  
  func makeSlot(at position: CGPoint, isGood: Bool) {
    var slotBase: SKSpriteNode
    var slotGlow: SKSpriteNode
    
    if isGood {
      slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
      slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
      slotBase.name = "good"
    } else {
      slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
      slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
      slotBase.name = "bad"
    }
    
    slotBase.position = position
    slotGlow.position = position
    
    addChild(slotBase)
    addChild(slotGlow)
    
    slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
    slotBase.physicsBody?.isDynamic = false
    
    let spin = SKAction.rotate(byAngle:.pi, duration: 10)
    let spinForever = SKAction.repeatForever(spin)
    slotGlow.run(spinForever)
    
  }
  
  func makeBouncerAt(position: CGPoint) {
    let bouncer = SKSpriteNode(imageNamed: "bouncer")
    bouncer.position = position
    bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
    bouncer.physicsBody!.contactTestBitMask = bouncer.physicsBody!.collisionBitMask
    bouncer.physicsBody!.isDynamic = false
    addChild(bouncer)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      let location = touch.location(in: self)
      
      let objects = nodes(at: location) as [SKNode]
      
      if objects.contains(editLabel) {
        editingMode = !editingMode
      } else {
        if editingMode {
          let size = CGSize(width: RandomInt(min: 16, max: 128), height: 16)
          let box = SKSpriteNode(color: RandomColor(), size: size)
          box.zRotation = RandomCGFloat(min: 0, max: 3)
          box.position = location
          
          box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
          box.physicsBody?.isDynamic = false
          
          addChild(box)
        } else {
          let ball = SKSpriteNode(imageNamed: "ballRed")
          ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
          ball.physicsBody!.contactTestBitMask = ball.physicsBody!.collisionBitMask
          ball.physicsBody!.restitution = 0.4
          ball.position = location
          ball.name = "ball"
          addChild(ball)
        }
      }
    }
  }
  
  func didBegin(_ contact: SKPhysicsContact) {
    if contact.bodyA.node?.name == "ball" {
      collisionBetweenBall(ball: contact.bodyA.node!, object: contact.bodyB.node!)
    } else if contact.bodyB.node?.name == "ball" {
      collisionBetweenBall(ball: contact.bodyB.node!, object: contact.bodyA.node!)
    }
  }
  
  func collisionBetweenBall(ball: SKNode, object: SKNode) {
    if object.name == "good" {
      destroyBall(ball: ball)
      score += 1
    } else if object.name == "bad" {
      destroyBall(ball: ball)
      score -= 1
    }
  }
  
  func destroyBall(ball: SKNode) {
    if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
      fireParticles.position = ball.position
      addChild(fireParticles)
    }
    
    ball.removeFromParent()
  }
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
  }
}
