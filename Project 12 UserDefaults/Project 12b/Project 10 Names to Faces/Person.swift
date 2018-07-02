//
//  Person.swift
//  Project 10 Names to Faces
//
//  Created by Felix Lin on 6/28/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit

class Person: NSObject, Codable {
  
  var name: String
  var image: String
  
  init(name: String, image: String) {
    self.name = name
    self.image = image
  }

}
