//
//  ViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/22/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit
//import SWRevealViewController.h

class RootViewController: UIViewController {
    
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var gestureScreenEdgePan: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var testImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
           
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width/2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

