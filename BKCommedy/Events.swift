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
    let id: Int
    
    
    init(name: String, time: String, tickets: String, venue: String, date: String, discription: String, key: String = "", id: Int) {
        self.name = name
        self.time = time
        self.tickets = tickets
        self.venue = venue
        self.date = date
        self.discription = discription
        self.id = id
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "time": time,
            "tickets": tickets,
            "venue": venue,
            "date": date,
            "discription": discription,
            "id" : id
        ]
    }
    
}


/*extension Events : Equatable {
 
 public static func ==(lhs: Events, rhs: Events) -> Bool{
 
 return (lhs.name == rhs.name) &&
 (lhs.time == rhs.time) &&
 (lhs.tickets == rhs.tickets) &&
 (lhs.venue == rhs.venue) &&
 (lhs.date == rhs.date) &&
 (lhs.discription == rhs.discription)
 }
 
 }
 
 extension Events : Comparable{
 
 public static func <(lhs: Events, rhs: Events) -> Bool{
 return lhs.name < rhs.name
 }
 }
 
*/

