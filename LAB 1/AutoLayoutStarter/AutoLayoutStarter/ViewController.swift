//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    

    // #######################################################
    // Red Views #############################################
    // #######################################################
    func getOrangeBox(_ widAnc: Float, _ heiAnc: Float) -> UIView {
        return {
            let view = UIView(frame: CGRect.zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .orange
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: CGFloat(heiAnc)),
                view.widthAnchor.constraint(equalToConstant: CGFloat(widAnc))
            ])
            return view
        }()
    }
    
    let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        NSLayoutConstraint.activate([
          view.heightAnchor.constraint(equalToConstant: 70),
          view.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        let orangeBox1: UIView = getOrangeBox(50, 60)
        let orangeBox2: UIView = getOrangeBox(50, 60)
        
        let boxesStackView2 = UIStackView(arrangedSubviews: [orangeBox1, orangeBox2])
        boxesStackView2.translatesAutoresizingMaskIntoConstraints = false
        boxesStackView2.axis = .horizontal
        boxesStackView2.alignment = .center
        boxesStackView2.distribution = .fill
        boxesStackView2.spacing = 5
        view.addSubview(boxesStackView2)
        NSLayoutConstraint.activate([
          boxesStackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          boxesStackView2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          boxesStackView2.heightAnchor.constraint(equalTo: view.heightAnchor),
          boxesStackView2.widthAnchor.constraint(equalToConstant: 140),
          boxesStackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
          boxesStackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
        ])
        return view
    }()
    main.addSubview(redView)
    NSLayoutConstraint.activate([
      redView.topAnchor.constraint(equalTo: main.topAnchor, constant: 20),
      redView.trailingAnchor.constraint(equalTo: main.trailingAnchor, constant: -10),
    ])
    // #######################################################
    

    
    
    // #######################################################
    // Purple Views ##########################################
    // #######################################################
    let purpleView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    main.addSubview(purpleView)
    NSLayoutConstraint.activate([
      purpleView.trailingAnchor.constraint(equalTo: main.trailingAnchor, constant: -10),
      purpleView.bottomAnchor.constraint(equalTo: main.bottomAnchor, constant: -10),
      purpleView.widthAnchor.constraint(equalTo: main.widthAnchor, multiplier: 0.7),
      purpleView.heightAnchor.constraint(equalToConstant: 80)
    ])
    // #######################################################
    
    
    
    
    // #######################################################
    // Blue Views ############################################
    // #######################################################
    func getBlueBox(_ widAnc: Float, _ heiAnc: Float) -> UIView {
        return {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .blue
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: CGFloat(heiAnc)),
                view.widthAnchor.constraint(equalToConstant: CGFloat(widAnc))
            ])
            return view
        }()
    }
    
    let blueView1: UIView = getBlueBox(80, 80)
    let blueView2: UIView = getBlueBox(80, 80)
    let blueView3: UIView = getBlueBox(80, 80)
    
    
    let boxesStackView = UIStackView(arrangedSubviews: [blueView1, blueView2, blueView3])
    boxesStackView.translatesAutoresizingMaskIntoConstraints = false
    boxesStackView.axis = .vertical
    boxesStackView.alignment = .center
    boxesStackView.spacing = 30
    boxesStackView.distribution = .equalSpacing
    main.addSubview(boxesStackView)
    NSLayoutConstraint.activate([
        boxesStackView.heightAnchor.constraint(equalTo: main.heightAnchor, multiplier: 0.8),
      boxesStackView.topAnchor.constraint(equalTo: main.topAnchor, constant: 50),
      boxesStackView.centerXAnchor.constraint(equalTo: main.centerXAnchor),
    ])
    // #######################################################
    
    
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
    
    
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

