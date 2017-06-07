//
//  MenuTableViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/6/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
      var menuItems: [String] = ["Schedual","LineUp","Venues", "Tickets", "About", "FAQ", "Sponsers"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(red:0.38, green:0.63, blue:0.68, alpha:0.4)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  /*  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        // PRAGMA MARK: HIDE VIEW SHOW CHOOSEN VIEW BUT KEEP MENU MAYBE PUT MENUE IN ITS OWN VIEW AND THEN HAVE EVERYHTING PRSENTED?
        
        if indexPath.row == 2 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "venueTableView") as? VenueTableViewController
            self.navigationController?.present(vc!, animated: false, completion: {
                print("presnted venue")
            })
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }*/
    

}
