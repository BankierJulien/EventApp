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
        
        self.navigationController?.navigationBar.configureFlatNavigationBar(with: UIColor.midnightBlue())
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.view.backgroundColor = UIColor.midnightBlue()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.aboutTextView.text = AboutStrings().about
        self.aboutTextView.backgroundColor = UIColor.midnightBlue()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func contactUsTapped(_ sender: Any) {
            let url = URL(string: "https://bkcomedyfestival.com/contact/")
            UIApplication.shared.open(url!)
    }
    

    
}
