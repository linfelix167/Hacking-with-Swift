//
//  InterfaceController.swift
//  Project 37  Psychic Tester WatchKit Extension
//
//  Created by Felix Lin on 8/6/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
  
  @IBOutlet weak var welcomeText: WKInterfaceLabel!
  @IBOutlet weak var hideButton: WKInterfaceButton!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    
    if WCSession.isSupported() {
      let session = WCSession.default
      session.delegate = self
      session.activate()
    }
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func hideWelcomeText() {
    welcomeText.setHidden(true)
    hideButton.setHidden(true)
  }
  
  func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    WKInterfaceDevice().play(.click)
  }
  
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
  }
}
