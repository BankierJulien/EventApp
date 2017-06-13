//
//  VenueTableViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class VenueTableViewController: UITableViewController {
    
    let venues = VenueStrings().venueArray
    var venueImage = UIImage()
    
    @IBOutlet var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //self.navigationController?.isToolbarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venue = venues[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "venueCell", for: indexPath) as! VenueTableViewCell
        cell.venueName.text = venue["name"]
        //place holder
        cell.venueImage.image = #imageLiteral(resourceName: "venues")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
       let venue = venues[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? VenueDetailViewController
        // add saftery here
        self.present(vc!, animated: false, completion: nil)
        vc?.venueName.text = venue["name"]!
        vc?.venueNumber.text = venue["number"]!
        vc?.venueAddress.text = venue["address"]!
        vc?.venueDescription.text = venue["discription"]!
        vc?.imageString = venue["image"]!

    }
    
    
}


