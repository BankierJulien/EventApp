//
//  Events.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/8/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation
// evnetual put time and date togather and find a way to get it
class Events: NSObject, NSCoding {
    
    let headliner: String
    let openers: String
    let time: String
    let tickets: String
    let venue: String
    let date: String
    let eventDescription : String
    let id: Int
    
    
    init(headliner: String, openers: String ,time: String, tickets: String, venue: String, date: String, eventDescription: String, key: String = "", id: Int) {
        self.headliner = headliner
        self.openers = openers
        self.time = time
        self.tickets = tickets
        self.venue = venue
        self.date = date
        self.eventDescription = eventDescription
        self.id = id
    }
    
    func toAnyObject() -> Any {
        return [
            "headliner": headliner,
            "openers": openers,
            "time": time,
            "tickets": tickets,
            "venue": venue,
            "date": date,
            "eventDescription": eventDescription,
            "id" : id
        ]
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let headliner = aDecoder.decodeObject(forKey: "headliner") as! String
        let openers = aDecoder.decodeObject(forKey: "openers") as! String
        let time = aDecoder.decodeObject(forKey: "time") as! String
        let tickets = aDecoder.decodeObject(forKey: "tickets") as! String
        let venue = aDecoder.decodeObject(forKey: "venue") as! String
        let date = aDecoder.decodeObject(forKey: "date") as! String
        let eventDescription = aDecoder.decodeObject(forKey: "eventDescription") as! String
        let id = aDecoder.decodeInteger(forKey: "id") 

        self.init(headliner: headliner, openers: openers, time: time, tickets: tickets, venue: venue, date: date, eventDescription: eventDescription, id: id)

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(headliner, forKey: "headliner")
        aCoder.encode(openers, forKey: "openers")
        aCoder.encode(time, forKey: "time")
        aCoder.encode(tickets, forKey: "tickets")
        aCoder.encode(venue, forKey: "venue")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(eventDescription, forKey: "eventDescription")
        aCoder.encode(id, forKey: "id")
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        let obj = object as! Events
        if self.id == obj.id {
            return true
        } else {
            return false
        }
    }

    
}




