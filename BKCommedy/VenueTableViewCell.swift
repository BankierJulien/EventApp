//
//  VenueTableViewCell.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/31/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {
    @IBOutlet var venueImage: UIImageView!
    @IBOutlet var venueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
