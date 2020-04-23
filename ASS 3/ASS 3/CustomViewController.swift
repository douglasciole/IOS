//
//  CustomViewController.swift
//  ASS 3
//
//  Created by Douglas Gois on 2020-04-22.
//  Copyright © 2020 Douglas Gois. All rights reserved.
//

import UIKit

class CustomViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let play = UIBarButtonItem(title: "To Entrance", style: .plain, target: self, action: #selector(goToEntrance))
        navigationItem.rightBarButtonItems = [play]
        // Do any additional setup after loading the view.
    }
    
    @objc func goToEntrance() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
