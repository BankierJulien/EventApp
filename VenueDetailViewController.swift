//
//  VenueDetailViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class VenueDetailViewController: UIViewController {
    
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
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.downloadVenueImage(imageUrl: self.imageString)
        self.imageNameLabel.text = self.venueName.text
        self.urlButton.setTitle(self.venueName.text! + ".com", for: UIControlState.normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadVenueImage(imageUrl: String){
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
                        DispatchQueue.main.async() { () -> Void in
                            self.venueImage.image = image
                        }
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
    }
    
    
    @IBAction func urlButtonPressed(_ sender: UIButton) {
        let stringWithHTTPPrepended = "http://\(String(describing: self.urlButton.title(for: .normal)!))".replacingOccurrences(of:" ", with: "")
        let url = URL(string: stringWithHTTPPrepended)
        UIApplication.shared.open(url!)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
