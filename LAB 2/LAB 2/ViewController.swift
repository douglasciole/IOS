//
//  ViewController.swift
//  LAB 2
//
//  Created by Douglas Gois on 2020-04-16.
//  Copyright © 2020 Douglas Gois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    private var isLightOn: Bool! = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainView.isUserInteractionEnabled = true;
    }

    @IBAction func OnTap(_ sender: Any) {
        if (isLightOn) {
            isLightOn = false;
            mainView.backgroundColor = UIColor.black;
        }else {
            isLightOn = true;
            mainView.backgroundColor = UIColor.white;
        }
    }
    
}

