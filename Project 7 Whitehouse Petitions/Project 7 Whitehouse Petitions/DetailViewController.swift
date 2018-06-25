//
//  DetailViewController.swift
//  Project 7 Whitehouse Petitions
//
//  Created by Felix Lin on 6/25/18.
//  Copyright © 2018 Felix Lin. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  
  var webView: WKWebView!
  var detailItem: [String: String]!
  
  override func loadView() {
    webView = WKWebView()
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard detailItem != nil else { return }
    
    if let body = detailItem["body"] {
      var html = "<html>"
      html += "<head>"
      html += "<meta name=\"viewport\" content=\"width=devicewidth, initial-scale=1\">"
      html += "<style> body { font-size: 150%; } </style>"
      html += "</head>"
      html += "<body>"
      html += body
      html += "</body>"
      html += "</html>"
      webView.loadHTMLString(html, baseURL: nil)
    }
  }
}
