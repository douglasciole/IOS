//
//  SubTitleCell.swift
//  ProtocolPersistence
//
//  Created by Derrick Park on 5/5/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class SubTitleCell: UITableViewCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
