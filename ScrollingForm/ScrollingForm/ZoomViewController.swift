//
//  ZoomViewController.swift
//  ScrollingForm
//
//  Created by Derrick Park on 4/28/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.delegate = self
    updateZoom()
  }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func updateZoom() {
    let widthScale = view.bounds.size.width / imageView.bounds.size.width
    let height = view.bounds.size.height / imageView.bounds.size.height
    
    let scale = min(widthScale, height)
    scrollView.minimumZoomScale = scale
    scrollView.zoomScale = scale
  }
}
