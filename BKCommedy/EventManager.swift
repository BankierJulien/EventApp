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
    var wednesdayEvents = [Events]()
    var thursdayEvents = [Events]()
    var fridayEvents = [Events]()
    var saturdayEvents = [Events]()
    var sundayEvents = [Events]()



    // sixty One Local
    let testEventOne = Events(headliner: "John Doe",
                              openers: "Jo and friends",
                              time: "Doors open @ 11:00",
                              tickets: "url",
                              venue: "Sixty One Local",
                              date: "Monday",
                              eventDescription: "event",
                              id: 1,
                              eventImage: #imageLiteral(resourceName: "SplashOne"))
    
    let testEventTwo = Events(headliner: "Fred",
                              openers: "john and friends",
                              time: "10:0",
                              tickets: "url",
                              venue: "sixtyOneLocal",
                              date: "monday",
                              eventDescription: "event",
                              id: 2,
                              eventImage: #imageLiteral(resourceName: "SplashTwo") )
    
    let testEventsix = Events(headliner: "fred",
                              openers: "john and friends",
                              time: "10:0",
                              tickets: "url",
                              venue: "sixtyOneLocal",
                              date: "monday",
                              eventDescription: "event",
                              id: 3,
                              eventImage: #imageLiteral(resourceName: "SplashThree") )
    
    let testEventfive = Events(headliner: "fred",
                              openers: "john and friends",
                              time: "10:0",
                              tickets: "url",
                              venue: "sixtyOneLocal",
                              date: "monday",
                              eventDescription: "event",
                              id: 4,
                              eventImage: #imageLiteral(resourceName: "SplashFour") )
    
    let testEventThree = Events(headliner: "bob",
                                openers: "john and friends",
                                time: "doors open 10",
                                tickets: "url",
                                venue: "sixtyOneLocal",
                                date: "tuesday",
                                eventDescription: "event",
                                id: 5,
                                eventImage:#imageLiteral(resourceName: "matchlessImage") )
    
     let testEventFour = Events(headliner: "Julien Fishburn",
                                openers: "john and friends",
                                time: "doors 10",
                                tickets: "url",
                                venue: "blube",
                                date: "tuesday",
                                eventDescription: "event",
                                id: 6,
                                eventImage: #imageLiteral(resourceName: "bellhouseImage"))
    
    
    init(){
        self.allEvents.append(testEventOne)
        self.allEvents.append(testEventTwo)
        self.allEvents.append(testEventThree)
        self.allEvents.append(testEventFour)
        self.allEvents.append(testEventfive)
        self.allEvents.append(testEventsix)
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
