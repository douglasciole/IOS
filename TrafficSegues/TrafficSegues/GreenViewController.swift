//
//  GreenViewController.swift
//  TrafficSegues
//
//  Created by Derrick Park on 4/20/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
  // dependency injection
  var user: User! // implicitly unwrapped optional ("there will be an user! 100 %")
  
  @IBOutlet var userInfoLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "\(user.name) is \(user.hobby)"
    userInfoLabel.text = "\(user.name) \(user.hobby)"
    
  }
  
}
