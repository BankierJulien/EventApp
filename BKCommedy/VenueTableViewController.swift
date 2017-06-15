//
//  VenueTableViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class VenueTableViewController: UITableViewController {
    
    let venues = VenueManager().allVenues
    
    var venueImage = UIImage()
    
    
    @IBOutlet var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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
        cell.venueName.text = venue.name
        cell.venueImage.image = venue.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //clean up at some point
        print("You selected cell #\(indexPath.row)!")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVenueDetail" {
            let detailVC = segue.destination as! VenueDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let row = indexPath.row
            detailVC.selectedVenue = venues[row]
        }
    }
    
    
}


