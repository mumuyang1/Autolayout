//
//  BViewController.swift
//  Autolayout
//
//  Created by Yanzi Li on 2/24/17.
//  Copyright © 2017 Yanzi Li. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
  
  let padding: CGFloat = 20.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addRedAndGreenViewUsingNSLayoutAnchor()
  }
  
  func addRedAndGreenViewUsingNSLayoutAnchor() {
    let redView = UIView()
    redView.translatesAutoresizingMaskIntoConstraints = false
    redView.backgroundColor = UIColor.red
    view.addSubview(redView)
    
    let greenView = UIView()
    greenView.backgroundColor = UIColor.green
    greenView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(greenView)
    
    redView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: padding).isActive = true
    redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
    redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
    redView.trailingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: -padding).isActive = true
    redView.widthAnchor.constraint(equalTo: greenView.widthAnchor, multiplier:1/3).isActive = true
    
    greenView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
    greenView.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
  }
}
