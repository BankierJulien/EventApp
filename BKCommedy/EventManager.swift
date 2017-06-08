//
//  eventStrings.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/8/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation



struct EventManager {
    // make a class of type nsdictionary that returns a dictionary wiht the shit needed
    var allEvents = [Events]()
    var mondayEvents = [Events]()
    // sixty One Local
     let testEventOne = Events(name: "edy", time: "10:0", tickets: "url", venue: "sixtyOneLocal", date: "monday", userAddedToCalender: false, discription: "event")
     let testEventTwo = Events(name: "edy", time: "10:0", tickets: "url", venue: "sixtyOneLocal", date: "monday", userAddedToCalender: false, discription: "event")
    
    init(){
        self.allEvents.append(testEventOne)
        self.allEvents.append(testEventTwo)
        for event in self.allEvents{
            if event.date == "monday"{
                self.mondayEvents.append(event)
            }
        }
    }
    
    
    
    
    
    
}
