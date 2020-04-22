//
//  BlueViewController.swift
//  TrafficSegues
//
//  Created by Derrick Park on 4/20/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let identifier = segue.identifier {
      switch identifier {
        case "unwindToRed":
          if let destinationVC = segue.destination as? ViewController {
            // do the same as forward segue
          }
        case "GoToPurple":
//          if let destinationVC = segue.destination as? PurpleViewController {
//            // do the same as forward segue
//          }
          print("prepareForPurple")
        case "GoToOrange":
          print("prepareForOrange")
        default:
          fatalError("Wrong segue identifier")
      }
    }
  }

  @IBAction func purpleButtonTapped(_ sender: UIButton) {
    performSegue(withIdentifier: "GoToPurple", sender: sender)
  }
  
  @IBAction func orangeButtonTapped(_ sender: UIButton) {
    performSegue(withIdentifier: "GoToOrange", sender: sender)
  }
  
}
