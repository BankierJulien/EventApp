//
//  eventStrings.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/8/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation



struct EventManager {

    var allEvents = [Events]()
    var mondayEvents = [Events]()
    var tuesdayEvents = [Events]()

    // sixty One Local
    let testEventOne = Events(headliner: "John Doe", openers: "john and friends", time: "0:0", tickets: "url", venue: "sixtyOneLocal", date: "monday",  eventDescription: "event", id: 1)
    let testEventTwo = Events(headliner: "fred", openers: "john and friends", time: "10:0", tickets: "url", venue: "sixtyOneLocal", date: "monday",  eventDescription: "event", id: 2)
    let testEventThree = Events(headliner: "bob", openers: "john and friends",  time: "doors open 10", tickets: "url", venue: "sixtyOneLocal", date: "tuesday",  eventDescription: "event", id: 3)
     let testEventFour = Events(headliner: "Julien Fishburn", openers: "john and friends",  time: "doors 10", tickets: "url", venue: "blube", date: "tuesday",  eventDescription: "event", id: 4)
    
    
    init(){
        self.allEvents.append(testEventOne)
        self.allEvents.append(testEventTwo)
        self.allEvents.append(testEventThree)
        self.allEvents.append(testEventFour)
        // make this better
        for event in self.allEvents{
            if event.date == "monday"{
                self.mondayEvents.append(event)
            }
            else if event.date == "tuesday"{
                self.tuesdayEvents.append(event)
            }
            else if event.date == "wednesday"{
            }
            else if event.date == "thursday"{
            }
        }
    }
    
    
    
    
    
    
}
