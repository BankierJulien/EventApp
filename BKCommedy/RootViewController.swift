//
//  ViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/22/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit
//import SWRevealViewController.h

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var menuButton: UIBarButtonItem!
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
       /* let originalImage = UIImage(named: "HamburgerMenuItem")
        let scaledIcon = UIImage(cgImage: (originalImage?.cgImage)!, scale: 20, orientation: (originalImage?.imageOrientation)!)
        menuButton.image = scaledIcon*/
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
           
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width/2

     //   self.view.backgroundColor = UIColor(red:0.38, green:0.63, blue:0.68, alpha:1.0)

   
        
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
          //      self.hideMenu()
            } else {
          //      self.openMenu()
            }
        }
    }
    

}

