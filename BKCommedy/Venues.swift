//
//  Venues.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/8/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation
struct Venues {
    
    let name: String
    let address: String
    let number: String
    let url: String
    let description: String
    let image : UIImage
   // let id: Int
    //FIND A WAY TO LOAD IMAGE IN HERE
    
    init(name: String, address: String, number: String, url: String, description: String, image: UIImage) {
        self.name = name
        self.address = address
        self.number = number
        self.url = url
        self.description = description
        self.image = image
    }
    
   
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "address": address,
            "number": number,
            "url": url,
            "description": description,
            "image": image
        ]
    }
    
}
