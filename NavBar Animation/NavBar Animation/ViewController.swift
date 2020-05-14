//
//  ViewController.swift
//  NavBar Animation
//
//  Created by Douglas Gois on 2020-05-13.
//  Copyright © 2020 Douglas Gois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var navBar: UIView?
    var closedFrame: CGRect?
    var openFrame: CGRect?
    var titleBar = UILabel()
    var stack: UIStackView?
    var itemsList: UITableView?
    var itemsListSrc = [String]()
    
    var isOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closedFrame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 88)
        openFrame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        
        
        closeState(closedFrame!)
    }
    
    func closeState(_ closedFrame: CGRect) {
        navBar = UIView(frame: closedFrame)
        navBar!.backgroundColor = UIColor(hex: "#DDDDDDFF")
        
        let btnToggle: UIButton = UIButton()
        btnToggle.setTitle("＋", for: .normal)
        btnToggle.setTitleColor(UIColor.blue, for: .normal)
        btnToggle.frame = CGRect(x: closedFrame.width - 50, y: 44, width: 50, height: 50)
        btnToggle.addTarget(self, action: #selector(self.btnToggle), for: .touchUpInside)
        
        
        stack = UIStackView()
        stack?.axis = .horizontal
        stack!.frame = openFrame!
        
        let btnWidth = self.view.frame.size.width / 5
        let btnHeight:CGFloat = 90
        
        let b1 = UIButton()
//        b1.snack = "Oreos"
        b1.addTarget(self, action: #selector(self.addSnack), for: .touchUpInside)
        b1.setImage(UIImage(named: "oreos"), for: .normal)
        b1.frame = CGRect(x: btnWidth * 0, y: 100, width: btnWidth, height: btnHeight)
        
        let b2 = UIButton()
//        b2.snack = "Pizza Pockets"
        b2.addTarget(self, action: #selector(self.addSnack), for: .touchUpInside)
        b2.setImage(UIImage(named: "pizza_pockets"), for: .normal)
        b2.frame = CGRect(x: btnWidth * 1, y: 100, width: btnWidth, height: btnHeight)
        
        let b3 = UIButton()
//        b3.snack = "Pop Tarts"
        b3.addTarget(self, action: #selector(self.addSnack), for: .touchUpInside)
        b3.setImage(UIImage(named: "pop_tarts"), for: .normal)
        b3.frame = CGRect(x: btnWidth * 2, y: 100, width: btnWidth, height: btnHeight)
        
        let b4 = UIButton()
//        b4.snack = "Popsicle"
        b4.addTarget(self, action: #selector(self.addSnack), for: .touchUpInside)
        b4.setImage(UIImage(named: "popsicle"), for: .normal)
        b4.frame = CGRect(x: btnWidth * 3, y: 100, width: btnWidth, height: btnHeight)
        
        let b5 = UIButton()
//        b5.snack = "Ramen"
        b5.addTarget(self, action: #selector(self.addSnack), for: .touchUpInside)
        b5.setImage(UIImage(named: "ramen"), for: .normal)
        b5.frame = CGRect(x: btnWidth * 4, y: 100, width: btnWidth, height: btnHeight)
        
        stack!.addSubview(b1)
        stack!.addSubview(b2)
        stack!.addSubview(b3)
        stack!.addSubview(b4)
        stack!.addSubview(b5)
        
        stack!.distribution = .fill
        stack!.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        
        titleBar.text = "SNACKS"
        titleBar.textAlignment = .center
        titleBar.frame = CGRect(x: 0, y: 44, width: closedFrame.width, height: 50)
        
        itemsList = UITableView()
        itemsList!.frame = CGRect(x: 0, y: 88, width: closedFrame.width, height: self.view.frame.size.height)
        itemsList!.translatesAutoresizingMaskIntoConstraints = false
        
        navBar!.addSubview(stack!)
        navBar!.addSubview(titleBar)
        navBar!.addSubview(btnToggle)
        view.addSubview(navBar!)
        view.addSubview(itemsList!)
        
    }
    
    @objc func addSnack(sender: UIButton!) {
        self.itemsListSrc.append("Teste")
        itemsList!.reloadData()
    }
    
    @objc func btnToggle(sender: UIButton!) {
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [.curveEaseInOut], animations: {
            
            self.isOpen = !self.isOpen
            
            if (self.isOpen) {
                let scaleTransform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.stack!.transform = scaleTransform
                
                self.itemsList!.frame = CGRect(x: 0, y: 200, width: self.closedFrame!.width, height: self.view.frame.size.height)
                
                self.titleBar.text = "Add a SNACK"
                self.titleBar.frame = CGRect(x: 0, y: 60, width: self.closedFrame!.width, height: 50)
                self.navBar!.frame = self.openFrame!
                let rotationTransform = CGAffineTransform(rotationAngle: .pi / 4)
                sender.transform = rotationTransform
                
            }else {
                let scaleTransform = CGAffineTransform(scaleX: 1.0, y: 0.0)
                self.stack!.transform = scaleTransform
                
                self.itemsList!.frame = CGRect(x: 0, y: 88, width: self.closedFrame!.width, height: self.view.frame.size.height)
                
                self.titleBar.text = "SNACKS"
                self.titleBar.frame = CGRect(x: 0, y: 44, width: self.closedFrame!.width, height: 50)
                self.navBar!.frame = self.closedFrame!
                let rotationTransform = CGAffineTransform(rotationAngle: .pi)
                sender.transform = rotationTransform
            }
        }, completion: nil)
    }
    
    
}

extension ViewController: UIButton {
    public var snack : String?
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemsListSrc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Douglas"
        return cell
    }
    
    
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
