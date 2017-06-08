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
    let testEventOne = Events(name: "edy", time: "10:0", tickets: "url", venue: "sixtyOneLocal", date: "monday",  discription: "event", id: 1)
    let testEventTwo = Events(name: "fred", time: "10:0", tickets: "url", venue: "sixtyOneLocal", date: "monday",  discription: "event", id: 2)
    let testEventThree = Events(name: "bob", time: "doors open 10", tickets: "url", venue: "sixtyOneLocal", date: "tuesday",  discription: "event", id: 3)
    
    
    init(){
        self.allEvents.append(testEventOne)
        self.allEvents.append(testEventTwo)
        self.allEvents.append(testEventThree)
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
