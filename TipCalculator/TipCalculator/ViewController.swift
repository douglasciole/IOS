//
//  ViewController.swift
//  TipCalculator
//
//  Created by Douglas Gois on 2020-04-28.
//  Copyright © 2020 Douglas Gois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipBar: UISlider!
    @IBOutlet weak var tipFinal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func calcTipValue() {
        let billValue = Double(billAmount.text!)
        let barValue = Double(tipBar.value)
        tipFinal.text = String(Int(billValue! * barValue))
    }
    
    @IBAction func calc(_ sender: Any) {
        calcTipValue()
    }
    @IBAction func onBillAmountChange(_ sender: Any) {
        calcTipValue()
    }
    @IBAction func onTipBarChange(_ sender: Any) {
        calcTipValue()
    }
    
}

