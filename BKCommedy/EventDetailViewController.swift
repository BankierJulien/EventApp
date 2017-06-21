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
        
        self.navigationController?.title = selectedEvent.headliner
//        self.navigationController?.navigationBar.it TitleTextAttributes = ([NSForegroundColorAttributeName: UIColor.init(red: 200/255, green: 64/255, blue: 50/255, alpha: 1.0) ], for: .selected)

        
        self.eventHeadlingerLabel.text = selectedEvent.headliner
        self.eventOpenersLabel.text = selectedEvent.openers
        self.eventVenueLabel.text = selectedEvent.venue
        self.eventTimeLabel.text = selectedEvent.time
        self.eventDescriptionLabel.text = selectedEvent.eventDescription
        self.eventImageView.image = selectedEvent.eventImage

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
