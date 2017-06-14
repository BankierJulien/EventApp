//
//  VenueStrings.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation

struct VenueManager {
    // make a class of type nsdictionary that returns a dictionary wiht the shit needed
    //FIND A WAY TO LOAD IMAGE IN HERE

    var allVenues = [Venues]()
    // sixty One Local
 
    let sixtyOneLocalVenue = Venues(name: "61 Local",
                                    address: "61 Bergen St. Brooklyn, NY 11201",
                                    number: "+1 718-875-1150",
                                    url: "http://61local.com/",
                                    description: "61 Local is a true public house where the community comes to eat, drink, celebrate and collaborate.",
                                    imageString: "https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eaff5859cc68cc4f36fb3d/1475018585158/banner_local61.jpg")
    
    let annoyanceTheatreNYVenue = Venues(name: "Annoyance Theatre NY",
                                         address: "367 Bedford Avenue, Basement,(Entrance on S. 5th) Brooklyn, NY 11211",
                                         number: "+1 718-569-7810",
                                         url: "http://theannoyancenewyork.com/",
                                         description: "The Annoyance NY features shows ranging from improvisation to musicals, plays, sketch-comedy, and variety in a vibrant and uncensored atmosphere.",
                                         imageString: "https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eb0b80414fb577177ebc9e/1475021697958/banner_annoyance.jpg")
    // add times qoute
    let barMatchless = Venues(name: "Bar Matchless",
                                         address: "557 Manhattan Ave Brooklyn, NY 11222",
                                         number: "+1 718-383-5333",
                                         url: "http://http://barmatchless.com/",
                                         description: "The shocks & struts sign is a vestige of the former tenant, an auto-parts shop. Matchless actually refers to a classic British motorcycle. The appointments would attract anyone looking for a good night out: large, comfortable booths; 16 beers on tap; a foosball table; a winding, custom-made copper bar that accommodates couples; even a small gallery that features local artists.",
                                         imageString: "https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eafce2ff7c509e16927d90/1475017954982/banner_matchless.jpg")
    

    
    let theBellHouse = Venues(name: "The Bell House",
                              address: "149 7th St Brooklyn, NY 11215",
                              number: "+1 718-643-6510",
                              url: "http://thebellhouseny.com/",
                              description: "In the Fall of 2008, a 1920’s warehouse was converted into The Bell House. Called “a welcome oasis” by TimeOut, The Bell House is a magnificent two-room music and events venue located in the Gowanus section of Brooklyn. ",
                              imageString: "https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eafd8b46c3c474982f703c/1475018125152/banner_bellhouse.jpg")
    
    let brookynBrewery = Venues(name: "Brooklyn Brewery",
                                address: "79 N 11th St. Brooklyn, NY 11249",
                              number: "+1 718-486-7422",
                              url: "http://brooklynbrewery.com.com/",
                              description: "The Brooklyn Brewery makes good beer, loves good food, and has lots of good friends in Williamsburg and beyond.",
                              imageString: "https://static1.squarespace.com/static/57e969aeebbd1a2e593abbb7/t/57eaffc7c534a59d49020db5/1475018696849/banner_brooklynbrewery.jpg")

    init(){
        allVenues.append(sixtyOneLocalVenue)
        allVenues.append(annoyanceTheatreNYVenue)
        allVenues.append(barMatchless)
        allVenues.append(theBellHouse)
        allVenues.append(brookynBrewery)
        
    }
    
    
    
    
    
    
}

