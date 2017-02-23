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
  let redViewMinWidth: CGFloat = 150.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    addRedAndGreenViewUsingNSLayoutAnchor()
    addRedAndGreenViewUsingNSLayoutContraint()
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
    let redViewAspectWidthConstraint = redView.widthAnchor.constraint(equalTo: greenView.widthAnchor, multiplier:1/3)
    redViewAspectWidthConstraint.priority = UILayoutPriorityDefaultHigh
    redViewAspectWidthConstraint.isActive = true
    redView.widthAnchor.constraint(greaterThanOrEqualToConstant: redViewMinWidth).isActive = true
  
    greenView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
    greenView.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
  }
  
  func addRedAndGreenViewUsingNSLayoutContraint() {
    let redView = UIView()
    redView.translatesAutoresizingMaskIntoConstraints = false
    redView.backgroundColor = UIColor.red
    view.addSubview(redView)
    
    let greenView = UIView()
    greenView.backgroundColor = UIColor.green
    greenView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(greenView)
   
    NSLayoutConstraint.init(item: redView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1, constant: padding).isActive = true
    NSLayoutConstraint.init(item: redView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: padding).isActive = true
    NSLayoutConstraint.init(item: redView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -padding).isActive = true
    let redViewAspectWidthConstraint = NSLayoutConstraint.init(item: redView, attribute: .width, relatedBy: .equal, toItem: greenView, attribute: .width, multiplier: 1/3, constant: 0)
    redViewAspectWidthConstraint.priority = UILayoutPriorityDefaultHigh
    redViewAspectWidthConstraint.isActive = true
    
    NSLayoutConstraint.init(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: redViewMinWidth).isActive = true
    NSLayoutConstraint.init(item: redView, attribute: .trailing, relatedBy: .equal, toItem: greenView, attribute: .leading, multiplier: 1, constant: -padding).isActive = true
    NSLayoutConstraint.init(item: greenView, attribute: .top, relatedBy: .equal, toItem: redView, attribute: .top, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint.init(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: redView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint.init(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -padding).isActive = true
  }
}
