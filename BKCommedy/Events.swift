//
//  Events.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/8/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation
// evnetual put time and date togather and find a way to get it
struct Events {
    
    let name: String
    let time: String
    let tickets: String
    let venue: String
    let date: String
    let discription : String 
    var userAddedToCalender : Bool
    
    
    init(name: String, time: String, tickets: String, venue: String, date: String, userAddedToCalender: Bool, discription: String, key: String = "") {
        self.name = name
        self.time = time
        self.tickets = tickets
        self.venue = venue
        self.date = date
        self.discription = discription
        self.userAddedToCalender = userAddedToCalender
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "time": time,
            "tickets": tickets,
            "venue": venue,
            "date": date,
            "discription": discription,
            "userAddedToCalender": userAddedToCalender
        ]
    }
    
}

