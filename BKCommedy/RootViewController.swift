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
    
    // slide in text https://www.andrewcbancroft.com/2014/09/24/slide-in-animation-in-swift/
    
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var gestureScreenEdgePan: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var homeImageView: UIImageView!
    
    var imageArray = [#imageLiteral(resourceName: "SplashOne"), #imageLiteral(resourceName: "SplashTwo"), #imageLiteral(resourceName: "SplashThree"), #imageLiteral(resourceName: "SplashFour")]
    var index = 0
   // var homeImageTimer : Timer
    
    
    @IBOutlet var introTextLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = introTextLabel.bounds
        introTextLabel.addSubview(blurView)
        introTextLabel.sendSubview(toBack: blurView)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = self.view.frame.width/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ = Timer.scheduledTimer(timeInterval: 5, target: self,  selector: (#selector(fadeImage)), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      //  self.homeImageTimer = nil
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: stop vtimer on exits
    func fadeImage() {
        index = index < self.imageArray.count - 1 ? index + 1: 0
        self.homeImageView.image = imageArray[index]
        self.homeImageView.slideInFromRight()
    }
    
}

