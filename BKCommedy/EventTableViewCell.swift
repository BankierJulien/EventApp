//
//  EventTableViewCell.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/8/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var eventPerformer: UILabel!
    @IBOutlet var eventOpeners: UILabel!
    @IBOutlet var eventVenue: UILabel!
    @IBOutlet var eventTime: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//change image?
    @IBAction func addEventPressed(_ sender: Any) {
        
    }
}
