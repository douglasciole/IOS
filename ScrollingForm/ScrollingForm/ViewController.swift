//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Derrick Park on 4/28/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    registerForKeyboardNotification()
  }
  
  fileprivate func registerForKeyboardNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardDidShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWasShown(_ notification: Notification) {
    guard let info = notification.userInfo, let keyboardFrame = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
    
    let keyboardSize = keyboardFrame.cgRectValue.size
    let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    scrollView.contentInset = insets
    scrollView.scrollIndicatorInsets = insets
  }
  
  @objc func keyboardWillBeHidden(_ notification: Notification) {
    scrollView.contentInset = UIEdgeInsets.zero
    scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
  }
}

