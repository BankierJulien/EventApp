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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("h")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venue = venues[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "venueCell", for: indexPath) as! VenueTableViewCell
        var image  = self.downloadVenueImage(imageUrl: venue["image"]!)
        cell.venueName.text = venue["name"]
        cell.venueImage.image = image
     /*   DispatchQueue.main.async() { () -> Void in
        cell.venueImage.image = self.downloadVenueImage(imageUrl: venue["image"]!)

        }*/
        
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
       let venue = venues[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? VenueDetailViewController
        self.present(vc!, animated: false, completion: nil)
        // add saftery here
        vc?.venueName.text = venue["name"]!
        vc?.venueNumber.text = venue["number"]!
        vc?.venueAddress.text = venue["address"]!
        vc?.venueDescription.text = venue["discription"]!
        vc?.venueImage.image = self.downloadVenueImage(imageUrl: venue["image"]!)
       // vc?.imageString = venue["image"]!
    }
    
    
    func downloadVenueImage(imageUrl: String) -> UIImage {
        let venueImageURL = URL(string: imageUrl)!
        let session = URLSession(configuration: .default)
        var image = UIImage()
        
        let downloadPicTask = session.dataTask(with: venueImageURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading venue picture: \(e)")
            } else {
                // No errors found.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded venue picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        image = UIImage(data: imageData)!
                     
                       // self.venueImage = image

                     
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
        return image
    }
    
}


