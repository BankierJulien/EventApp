//
//  VenueDetailViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class VenueDetailViewController: UIViewController {
    
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var venueImage: UIImageView!
    @IBOutlet var venueName: UILabel!
    @IBOutlet var venueAddress: UILabel!
    @IBOutlet var venueNumber: UILabel!
    @IBOutlet var venueDescription: UILabel!
    @IBOutlet var imageNameLabel: UILabel!
    @IBOutlet var urlButton: UIButton!
    
    var imageString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.venueDescription.numberOfLines = 0
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.downloadVenueImage(imageUrl: self.imageString)
        self.imageNameLabel.text = self.venueName.text
        self.urlButton.setTitle(self.venueName.text! + ".com", for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func downloadVenueImage(imageUrl: String){
        let venueImageURL = URL(string: imageUrl)!
        let session = URLSession(configuration: .default)
        var image = UIImage()
        
        let downloadPicTask = session.dataTask(with: venueImageURL) { (data, response, error) in
            if let e = error {
                print("Error downloading venue picture: \(e)")
            }
            else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded venue picture with response code \(res.statusCode)")
                    if let imageData = data {
                        image = UIImage(data: imageData)!
                        DispatchQueue.main.async() { () -> Void in
                            self.venueImage.image = image
                        }
                    }
                    else {
                        print("Couldn't get image: Image is nil")
                    }
                }
                else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
    }
    
    
    @IBAction func urlButtonPressed(_ sender: UIButton) {
        let stringWithHTTPPrepended = "http://\(String(describing: self.urlButton.title(for: .normal)!))".replacingOccurrences(of:" ", with: "")
        let url = URL(string: stringWithHTTPPrepended)
        UIApplication.shared.open(url!)
    }
    
}
