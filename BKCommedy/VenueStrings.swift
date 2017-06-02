//
//  VenueStrings.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation

struct VenueStrings {
    // make a class of type nsdictionary that returns a dictionary wiht the shit needed
    var venueArray = [[String : String]]()
    // sixty One Local
    let sixtyOneLocalVenue = ["name" : "61 Local",
                              "address" : "61 Bergen St. Brooklyn, NY 11201",
                              "number" : "+1 718-875-1150",
                              "url" : "http://61local.com/",
                              "discription" : "61 Local is a true public house where the community comes to eat, drink, celebrate and collaborate.",
                              "image": "https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eaff5859cc68cc4f36fb3d/1475018585158/banner_local61.jpg"]
    //Annoyance Theatre NY
    let annoyanceTheatreNYVenue = ["name" : "Annoyance Theatre NY",
                                   "address" : "367 Bedford Avenue, Basement,(Entrance on S. 5th) Brooklyn, NY 11211",
                                   "number" : "+1 718-569-7810",
                                   "url" : "theannoyancenewyork.com",
                                   "discription" : "The Annoyance NY features shows ranging from improvisation to musicals, plays, sketch-comedy, and variety in a vibrant and uncensored atmosphere.",
                                   "image" :"https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eaff5859cc68cc4f36fb3d/1475018585158/banner_local61.jpg" ]
    
    init(){
        venueArray.append(sixtyOneLocalVenue)
        venueArray.append(annoyanceTheatreNYVenue)
    }
    
    
    
    
}

