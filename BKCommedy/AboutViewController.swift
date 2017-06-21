//
//  AboutViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var contactUsButton: UIButton!
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var aboutTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.aboutTextView.text = AboutStrings().about
//        self.aboutTextView.backgroundColor = UIColor(red: 9/255, green: 9/255, blue: 26/255, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func contactUsTapped(_ sender: Any) {
            let url = URL(string: "https://bkcomedyfestival.com/contact/")
            UIApplication.shared.open(url!)
    }
    

    
}
