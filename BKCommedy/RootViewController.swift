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
    @IBOutlet var eventVenue: UILabel!
    @IBOutlet var eventTime: UILabel!
    @IBOutlet var eventDetailsHomePageView: UIView!
    
  
    var index = 0
    
    
    @IBOutlet var introTextLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.configureFlatNavigationBar(with: UIColor.midnightBlue())
        self.menuButton.tintColor = UIColor.alizarin()
    
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
        introTextLabel.backgroundColor = UIColor.midnightBlue()
        introTextLabel.alpha = 0.3
        
        
        let buttonWidth: CGFloat = 100
        let flatButton = FUIButton(frame: CGRect(x:self.view.frame.size.width/2 - buttonWidth,y:self.view.frame.size.height * 2/3 + self.introTextLabel.frame.size.height/2 , width:buttonWidth * 2, height:buttonWidth/2))
        flatButton.buttonColor = UIColor.alizarin()
        flatButton.shadowColor = UIColor.pomegranate()
        flatButton.cornerRadius = 6.0
        flatButton.shadowHeight = 3.0
        flatButton.setTitle("Buy Tickets", for: .normal)
        flatButton.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(flatButton)
        self.introTextLabel.sendSubview(toBack: introTextLabel)
        flatButton.addTarget(self, action:#selector(buyTicketPressed(Sender:)), for: .touchUpInside)


        
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
        self.eventText.text = EventManager().allEvents[index].headliner
        self.eventVenue.text = EventManager().allEvents[index].venue
        self.eventTime.text = EventManager().allEvents[index].time
        self.homeImageView.slideInFromRight()
        self.eventDetailsHomePageView.slideInFromRight()
    }
    
    func buyTicketPressed(Sender: UIButton){
        print("buy ticket pressed")
        
    }
    
}

