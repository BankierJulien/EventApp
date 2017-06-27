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
        self.navigationController?.navigationBar.configureFlatNavigationBar(with: UIColor.midnightBlue())
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
//        let backButton = UIButton(type: .custom)
//        backButton.setImage(#imageLiteral(resourceName: "backButton"), for: .normal)
//        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        backButton.addTarget(self, action: #selector(backButtonPressed(Sender:)), for: .touchUpInside)
//        let backButtonItem = UIBarButtonItem(customView: backButton)
//
//        self.navigationItem.setLeftBarButton(backButtonItem, animated: true)
        
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
    
    
    func backButtonPressed(Sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    

}
