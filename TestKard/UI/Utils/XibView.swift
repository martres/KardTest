//
//  XibView.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation
import UIKit

class XibView: UIView {
    var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}
private extension XibView {
    
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        guard let view = view else { return }
        view.frame = bounds
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
    }
}
