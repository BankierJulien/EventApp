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
    
    // slide in text https://www.andrewcbancroft.com/2014/09/24/slide-in-animation-in-swift/
    
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var gestureScreenEdgePan: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var homeImageView: UIImageView!
    @IBOutlet var eventText: UITextField!
    
  
    var index = 0
    
    
    @IBOutlet var introTextLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width/2

        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = introTextLabel.bounds
        introTextLabel.addSubview(blurView)
        introTextLabel.sendSubview(toBack: blurView)
        
        let buttonWidth: CGFloat = 100
        let flatButton = FUIButton(frame: CGRect(x:self.introTextLabel.frame.size.width/2 - buttonWidth,y:self.introTextLabel.frame.size.height * 2/3, width:buttonWidth * 2, height:buttonWidth/2))
        self.introTextLabel.addSubview(flatButton)
        flatButton.buttonColor = UIColor.alizarin()
        flatButton.shadowColor = UIColor.pomegranate()
        flatButton.cornerRadius = 6.0
        flatButton.shadowHeight = 3.0
        flatButton.setTitle("Buy Tickets", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)

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
        index = index <  EventManager().allEvents.count - 1 ? index + 1: 0
        self.homeImageView.image = EventManager().allEvents[index].eventImage
        let testString = EventManager().allEvents[index].headliner + " with " + EventManager().allEvents[index].openers + " @ " + EventManager().allEvents[index].venue
        self.eventText.text = testString
        self.homeImageView.slideInFromRight()
        self.eventText.slideInFromRight()
    }
    
}

