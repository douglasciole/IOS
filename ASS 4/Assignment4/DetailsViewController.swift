//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by user169155 on 4/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController : UIViewController {
    
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.title = "Details"+city.name
        
        let countryTitle = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 200, width: 300, height: 20))
        countryTitle.text = "Country"
        countryTitle.textAlignment = .center
        countryTitle.font = UIFont(name: "Helvetica Neue", size: 10)
        
        let countryLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 150, width: 300, height: 20))
        countryLabel.text = city.icon
        countryTitle.textAlignment = .center
        countryTitle.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let cityTitle = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 100, width: 300, height: 20))
        cityTitle.text = "City"
        cityTitle.textAlignment = .center
        cityTitle.font = UIFont(name: "Helvetica Neue", size: 10)
        
        let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 50, width: 300, height: 20))
        cityLabel.text = city.name
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let tempTitle = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 + 0, width: 300, height: 20))
        tempTitle.text = "Temperature"
        tempTitle.textAlignment = .center
        tempTitle.font = UIFont(name: "Helvetica Neue", size: 10)
        
        let tempLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 + 50, width: 300, height: 20))
        tempLabel.text = String(city.temp)
        tempTitle.textAlignment = .center
        tempTitle.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let sumTitle = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 + 100, width: 300, height: 20))
        sumTitle.text = "Summary"
        sumTitle.textAlignment = .center
        sumTitle.font = UIFont(name: "Helvetica Neue", size: 10)
        
        let sumLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 + 150, width: 300, height: 20))
        sumLabel.text = city.name
        sumLabel.textAlignment = .center
        sumLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        
        view.addSubview(countryTitle)
        view.addSubview(countryLabel)
        view.addSubview(cityTitle)
        view.addSubview(cityLabel)
        view.addSubview(tempTitle)
        view.addSubview(tempLabel)
        view.addSubview(sumTitle)
        view.addSubview(sumLabel)
        
        
        
    }
}
