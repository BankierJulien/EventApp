//
//  ViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/22/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var gestureScreenEdgePan: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var viewBlack: UIView!
    let maxBlackViewAlpha:CGFloat = 0.5
    @IBOutlet var leftWidthConstraint: NSLayoutConstraint!
    @IBOutlet var leftConstraint: NSLayoutConstraint!
    
   
    @IBOutlet var testImage: UIImageView!
    @IBOutlet var hamburgerMenuTableView: UITableView!
    var menuItems: [String] = ["Schedual","LineUp","Venues", "Tickets", "About", "FAQ", "Sponsers"]
    var barButtonPressed = false
   // let lineUp = LineupViewController()
    
    // seperate menu into its own class

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // menue table and shadow effect set up
        leftConstraint.constant = -leftWidthConstraint.constant
        viewBlack.alpha = 0
        viewBlack.isHidden = true
        
        // menu table view set up
        self.hamburgerMenuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.hamburgerMenuTableView.tableFooterView = UIView(frame:.zero)
        
        // view set up
        self.view.backgroundColor = UIColor(red:0.38, green:0.63, blue:0.68, alpha:1.0)
        self.hamburgerMenuTableView.backgroundColor = UIColor(red:0.38, green:0.63, blue:0.68, alpha:0.8)
        
        // nav bar button
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "HamburgerMenuItem.png"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(self.buttonHamburger), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        self.title = "BK COMMEDY FESTIVAL"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: TableView
  
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = menuItems[indexPath.row]
        
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        cell.textLabel?.text = item
        cell.backgroundColor = UIColor(red:0.38, green:0.63, blue:0.68, alpha:0.8)
        
        //MARK: UIVIEW WITH BUTTONS INSTEAD OF HAMBURGER MENU
        // Returning the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        // PRAGMA MARK: HIDE VIEW SHOW CHOOSEN VIEW BUT KEEP MENU MAYBE PUT MENUE IN ITS OWN VIEW AND THEN HAVE EVERYHTING PRSENTED?
        
        if indexPath.row == 2 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "venueTableView") as? VenueTableViewController
            self.navigationController?.present(vc!, animated: false, completion: {
                print("presnted venue")
            })
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    // MARK: Gestures

    @IBAction func gestureScreenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        // retrieve the current state of the gesture
        if sender.state == UIGestureRecognizerState.began {
            
            // if the user has just started dragging, make sure view for dimming effect is hidden well
            viewBlack.isHidden = false
            viewBlack.alpha = 0
        } else if (sender.state == UIGestureRecognizerState.changed) {
            
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            if -leftWidthConstraint.constant + translationX > 0 {
                
                // viewMenu fully dragged out
                leftConstraint.constant = 0
                viewBlack.alpha = maxBlackViewAlpha
            } else if translationX < 0 {
                
                // viewMenu fully dragged in
                leftConstraint.constant = -leftWidthConstraint.constant
                viewBlack.alpha = 0
            } else {
                
                // viewMenu is being dragged somewhere between min and max amount
                leftConstraint.constant = -leftWidthConstraint.constant + translationX
                
                let ratio = translationX / leftWidthConstraint.constant
                let alphaValue = ratio * maxBlackViewAlpha
                viewBlack.alpha = alphaValue
            }
        } else {
            
            // if the menu was dragged less than half of it's width, close it. Otherwise, open it.
            if leftConstraint.constant < -leftWidthConstraint.constant / 2 {
                self.hideMenu()
            } else {
                self.openMenu()
            }
        }
    }
    
    @IBAction func gestureTap(_ sender: UITapGestureRecognizer) {
        self.hideMenu()
    }
    
    
    @IBAction func gesturePan(_ sender: UIPanGestureRecognizer) {
        
        // retrieve the current state of the gesture
        if sender.state == UIGestureRecognizerState.began {
            
            // no need to do anything
        } else if sender.state == UIGestureRecognizerState.changed {
            
            // retrieve the amount viewMenu has been dragged
            let translationX = sender.translation(in: sender.view).x
            if translationX > 0 {
                
                // viewMenu fully dragged out
                leftConstraint.constant = 0
                viewBlack.alpha = maxBlackViewAlpha
            } else if translationX < -leftWidthConstraint.constant {
                
                // viewMenu fully dragged in
                leftConstraint.constant = -leftWidthConstraint.constant
                viewBlack.alpha = 0
            } else {
                
                // it's being dragged somewhere between min and max amount
                leftConstraint.constant = translationX
                
                let ratio = (leftWidthConstraint.constant + translationX) / leftWidthConstraint.constant
                let alphaValue = ratio * maxBlackViewAlpha
                viewBlack.alpha = alphaValue
            }
        } else {
            
            // if the drag was less than half of it's width, close it. Otherwise, open it.
            if leftConstraint.constant < -leftWidthConstraint.constant / 2 {
                self.hideMenu()
            } else {
                self.openMenu()
            }
        }
    }
    
    // MARK: Buttons
    
    @IBAction func buttonHamburger(_ sender: Any) {
        // PRAGMA MARK : FIX THIS LOGIC SINCE IT NOT WORKING WHEN U PPULL AWAY
        if !self.barButtonPressed{
            self.openMenu()
        }
        else {
            self.hideMenu()
        }
        self.barButtonPressed = !self.barButtonPressed
    }
    
    func openMenu() {
        
        // when menu is opened, it's left constraint should be 0
        leftConstraint.constant = 0
        
        // view for dimming effect should also be shown
        viewBlack.isHidden = false
        
        // animate opening of the menu - including opacity value
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            self.viewBlack.alpha = self.maxBlackViewAlpha
        }, completion: { (complete) in
            
            // disable the screen edge pan gesture when menu is fully opened
            self.gestureScreenEdgePan.isEnabled = false
        })
    }
    
    func hideMenu() {
        
        // when menu is closed, it's left constraint should be of value that allows it to be completely hidden to the left of the screen - which is negative value of it's width
        leftConstraint.constant = -leftWidthConstraint.constant
        
        // animate closing of the menu - including opacity value
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            self.viewBlack.alpha = 0
        }, completion: { (complete) in
            
            // reenable the screen edge pan gesture so we can detect it next time
            self.gestureScreenEdgePan.isEnabled = true
            
            // hide the view for dimming effect so it wont interrupt touches for views underneath it
            self.viewBlack.isHidden = true
        })
    }
    
}

