//
//  CViewController.swift
//  Autolayout
//
//  Created by Yanzi Li on 2/25/17.
//  Copyright © 2017 Yanzi Li. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
  
  @IBOutlet weak var purpleView: UIView!
  @IBOutlet weak var orangeView: UIView!
  
  let padding: CGFloat = 20.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let views: [String: Any] = ["purpleView": purpleView, "orangeView": orangeView, "topLayoutGuide": topLayoutGuide]

    let horizontalFormatString = "H:|-padding-[purpleView]-padding-[orangeView(==purpleView)]-padding-|"
    let verticalFormatString = "V:[topLayoutGuide]-padding-[purpleView]-padding-|"
    
    let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormatString, options: [.alignAllTop, .alignAllBottom], metrics: ["padding": padding], views: views)
    let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalFormatString, options: [], metrics: ["padding": padding], views: views)
    
    NSLayoutConstraint.activate(horizontalConstraints)
    NSLayoutConstraint.activate(verticalConstraints)
  }
}
