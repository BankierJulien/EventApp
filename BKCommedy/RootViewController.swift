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
    
    // TODO:
//    For event and sched : - events button toggle, - events load image, - events detail view, - scehdual switch properly, - remove duplicates from myevents, - events detail view
//    for venues : downlaod imaegs properly, figure out nav control, implemtn map view, ui updates
    // about: add faq
    // ui in general
    // root view: add content, have iamges animating
    // menu have sponsers animate
    // unit test?
    
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

