//
//  ContainerViewController.swift
//  TestKard
//
//  Created by Martreux Steven on 24/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import Foundation
import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet var buttons : [UIButton]!
    @IBOutlet weak var viewContainer: UIView!
    
    private let controllers: [UIViewController] = {
        let transactionViewController = UIStoryboard.main.instantiateViewController(withIdentifier: TransactionViewController.typeName)
        return  [UIViewController(), transactionViewController, UIViewController()]
    }()
    private var currentIndex: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons.forEach { button in
            button.layer.masksToBounds = false
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowRadius = 1.0
            button.layer.shadowOpacity = 0.5
            button.layer.shouldRasterize = true
            button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
            button.clipsToBounds = true
            
        }        
        showController(at: currentIndex)
    }
    
    @IBAction private func showFirstView() {
        showController(at: 0)
    }
    
    @IBAction private func showTransactions() {
        showController(at: 1)
    }
    
    @IBAction private func showThirdView() {
        showController(at: 2)
    }
    
    private func showController(at index: Int) {
        if currentIndex != index {
            let controller = controllers[currentIndex]
            controller.willMove(toParent: nil)
            controller.view.removeFromSuperview()
            controller.removeFromParent()
        }
        
        let controller = controllers[index]
        addChild(controller)
        controller.view.frame = self.view.bounds
        controller.willMove(toParent: self)
        viewContainer.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
        currentIndex = index
        buttons.forEach { $0.backgroundColor = .lightGray }
        buttons[index].backgroundColor = .purple
    }

    
    
    
}
