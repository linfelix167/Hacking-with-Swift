//
//  ViewController.swift
//  Project 37  Psychic Tester
//
//  Created by Felix Lin on 8/6/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

class ViewController: UIViewController {
  
  var allCards = [CardViewController]()
  var music: AVAudioPlayer!

  @IBOutlet weak var cardContainer: UIView!
  @IBOutlet weak var gradientView: GradientView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createParticles()
    loadCards()
    
    view.backgroundColor = .red
    
    UIView.animate(withDuration: 20, delay: 0, options: [.allowUserInteraction, .autoreverse, .repeat], animations: {
      self.view.backgroundColor = .blue
    })
    
    playMusic()
  }

  @objc func loadCards() {
    for card in allCards {
      card.view.removeFromSuperview()
      card.removeFromParent()
      
      view.isUserInteractionEnabled = true
    }
    
    allCards.removeAll(keepingCapacity: true)
    
    // create an array of card positions
    let positions = [
      CGPoint(x: 75, y: 85),
      CGPoint(x: 185, y: 85),
      CGPoint(x: 295, y: 85),
      CGPoint(x: 405, y: 85),
      CGPoint(x: 75, y: 235),
      CGPoint(x: 185, y: 235),
      CGPoint(x: 295, y: 235),
      CGPoint(x: 405, y: 235)
    ]
    
    // load and unwrap our Zener card images
    let circle = UIImage(named: "cardCircle")
    let cross = UIImage(named: "cardCross")
    let lines = UIImage(named: "cardLines")
    let square = UIImage(named: "cardSquare")
    let star = UIImage(named: "cardStar")
    
    // create an array of the images, one for each card, then shuffle it
    var images = [circle, circle, cross, cross, lines, lines, square, star]
    GKRandomSource.sharedRandom().arrayByShufflingObjects(in: images) as! [UIImage]
    
    for (index, position) in positions.enumerated() {
      // loop over each card position and create a new card view controller
      let card = CardViewController()
      card.delegate = self
      
      // use view controller containment and also add the card's view to our cardContainer view
      addChild(card)
      cardContainer.addSubview(card.view)
      card.didMove(toParent: self)
      
      // position the car appropriately, then give it an image from our array
      card.view.center = position
      card.front.image = images[index]
      
      // if we just gave the new card the star image, mark this as the correct answer
      if card.front.image == star {
        card.isCorrect = true
      }
      
      // add the new card view controller to our array for easier tracking
      allCards.append(card)
    }
  }
  
  func cardTapped(_ tapped: CardViewController) {
    guard view.isUserInteractionEnabled == true else { return }
    view.isUserInteractionEnabled = false
    
    for card in allCards {
      if card == tapped {
        card.wasTapped()
        card.perform(#selector(card.wasntTapped), with: nil, afterDelay: 1)
      } else {
        card.wasntTapped()
      }
    }
    
    perform(#selector(loadCards), with: nil, afterDelay: 2)
  }
  
  func createParticles() {
    let particleEmitter = CAEmitterLayer()
    
    particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
    particleEmitter.emitterShape = CAEmitterLayerEmitterShape.line
    particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
    particleEmitter.renderMode = CAEmitterLayerRenderMode.additive
    
    let cell = CAEmitterCell()
    cell.birthRate = 2
    cell.lifetime = 5.0
    cell.velocity = 100
    cell.velocityRange = 50
    cell.emissionLongitude = .pi
    cell.spinRange = 5
    cell.scale = 0.5
    cell.scaleRange = 0.25
    cell.color = UIColor(white: 1, alpha: 0.1).cgColor
    cell.alphaSpeed = -0.025
    cell.contents = UIImage(named: "particle")?.cgImage
    particleEmitter.emitterCells = [cell]

  }
  
  func playMusic() {
    if let musicURL = Bundle.main.url(forResource: "PhantomFromSpace", withExtension: "mp3") {
      if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
        music = audioPlayer
        music.numberOfLoops = -1
        music.play()
      }
    }
  }
}

