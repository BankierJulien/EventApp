//
//  EventDetailViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/19/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var eventHeadlingerLabel: UILabel!
    @IBOutlet var eventOpenersLabel: UILabel!
    @IBOutlet var eventVenueLabel: UILabel!
    @IBOutlet var eventTimeLabel: UILabel!
    @IBOutlet var eventDescriptionLabel: UILabel!
    @IBOutlet var eventImageView: UIImageView!
    @IBOutlet var buyTicketsButton: UIButton!
    
    var selectedEvent = Events(headliner: "", openers: "", time: "", tickets: "", venue: "", date: "", eventDescription: "", id: 0, eventImage: UIImage())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController?.title = "BK Comedy Fest Venues"
        
        self.eventHeadlingerLabel.text = selectedEvent.headliner
        self.eventOpenersLabel.text = selectedEvent.openers
        self.eventVenueLabel.text = selectedEvent.venue
        self.eventTimeLabel.text = selectedEvent.time
        self.eventDescriptionLabel.text = selectedEvent.eventDescription
        self.eventImageView.image = selectedEvent.eventImage
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
