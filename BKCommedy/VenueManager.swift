//
//  VenueStrings.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import Foundation

struct VenueManager {
    //CHECK ALL IMAGES/NUMBERS/ADRESS/WEBSITES
    // add new line for photos

    var allVenues = [Venues]()
    // sixty One Local
 
    let sixtyOneLocalVenue = Venues(name: "61 Local",
                                    address: "61 Bergen St. Brooklyn, NY 11201",
                                    number: "718-875-1150",
                                    url: "http://61local.com/",
                                    description: "61 Local is a true public house where the community comes to eat, drink, celebrate and collaborate.",
                                    image: #imageLiteral(resourceName: "61LocalImage"))
    
    let annoyanceTheatreNYVenue = Venues(name: "Annoyance Theatre NY",
                                         address: "367 Bedford Avenue, Basement,(Entrance on S. 5th) Brooklyn, NY 11211",
                                         number: "718-569-7810",
                                         url: "http://theannoyancenewyork.com/",
                                         description: "The Annoyance NY features shows ranging from improvisation to musicals, plays, sketch-comedy, and variety in a vibrant and uncensored atmosphere.",
                                         image: #imageLiteral(resourceName: "annoyanceImage"))
    // add times qoute
    let barMatchless = Venues(name: "Bar Matchless",
                                         address: "557 Manhattan Ave Brooklyn, NY 11222",
                                         number: "718-383-5333",
                                         url: "http://http://barmatchless.com/",
                                         description: "The shocks & struts sign is a vestige of the former tenant, an auto-parts shop. Matchless actually refers to a classic British motorcycle. The appointments would attract anyone looking for a good night out: large, comfortable booths; 16 beers on tap; a foosball table; a winding, custom-made copper bar that accommodates couples; even a small gallery that features local artists.",
                                         image: #imageLiteral(resourceName: "matchlessImage"))
    

    
    let theBellHouse = Venues(name: "The Bell House",
                              address: "149 7th St Brooklyn, NY 11215",
                              number: "718-643-6510",
                              url: "http://thebellhouseny.com/",
                              description: "In the Fall of 2008, a 1920’s warehouse was converted into The Bell House. Called “a welcome oasis” by TimeOut, The Bell House is a magnificent two-room music and events venue located in the Gowanus section of Brooklyn. ",
                              image: #imageLiteral(resourceName: "bellhouseImage"))
    
    let brookynBrewery = Venues(name: "Brooklyn Brewery",
                                address: "79 N 11th St. Brooklyn, NY 11249",
                              number: "718-486-7422",
                              url: "http://brooklynbrewery.com/",
                              description: "The Brooklyn Brewery makes good beer, loves good food, and has lots of good friends in Williamsburg and beyond.",
                              image: #imageLiteral(resourceName: "bkBreweryImage"))

    let brookynSuperhero = Venues(name: "Brooklyn Superhero Supply Co.",
                                  address: "372 5th Ave. Brooklyn, NY 11215",
                                number: "718-499-9884",
                                url: "http://superherosupplies.com/",
                                description: "The Brooklyn Superhero Supply Co. is a real place!  We are the storefront of 826NYC, a nonprofit dedicated to supporting students, ages 6-18, with their writing skills.",
                                image: #imageLiteral(resourceName: "superheroImage"))
    
    let dizzys = Venues(name: "Dizzy's on 5th",
                        address: "7230 5th Ave. Brooklyn, NY 11215",
                                number: "718-230-5551",
                                url: "http://dizzys.com/",
                                description: "With delicious Dizzy’s Diner food, great drinks and our old school hospitality it would very hard to not have a good time at The Room.",
                                image: #imageLiteral(resourceName: "dizzysImage"))
    
    let duckDuck = Venues(name: "Duck Duck",
                          address: "161 Montrose Ave. Brooklyn, NY 11206",
                                number: "347-799-1449",
                                url: "http://duckduckbar.com/",
                                description: "Carried by it's strong neighborhood vibe, small staff, and cast of daily regulars, you can always find a familiar friendly face. On the weekends we really like to let our freak feathers fly with a hopping crowd and a wide mix of djs. Always a selection of craft beers on tap, seasonal cocktails, and cheap beer and shot combos.",
                                image: #imageLiteral(resourceName: "duckduckImage"))
    
    let theGutter = Venues(name: "The Gutter",
                           address: "200 N 14th St. Brooklyn, NY 11211",
                                number: "718-387-3585",
                                url: "http://thegutterbrooklyn.com/",
                                description: "8 Lanes of vintage bowling and 12 craft beers in Greenpoint/Williamsburg, Brooklyn.",
                                image: #imageLiteral(resourceName: "thegutterImage"))
    
    let knittingFactory = Venues(name: "Knitting Factory Brooklyn",
                                 address: "361 Metropolitan Ave. Brooklyn, NY 11211",
                                number: "347-529-6696",
                                url: "http://bk.knittingfactory.com/",
                                description: "The Knitting Factory was founded in 1987 and over the years has grown into Knitting Factory Entertainment (KFE). (header photo by Rafe Baron)",
                                image: #imageLiteral(resourceName: "knittingfactoryImage"))
    //lemme know it moved
    let littleField = Venues(name: "Littlefield",
                             address: "635 Sacker St. Brooklyn, NY 11217",
                                number: "",
                                url: "http://littlefieldnyc.com/",
                                description: "Littlefield is a performance and art space in Brooklyn’s Gowanus neighborhood. Housed in a 6200-square foot textile warehouse dating from the 1920s, Littlefield merges the Gowanus’ industrial past with a sustainable future. (photo by Rafe Baron)",
                                image: #imageLiteral(resourceName: "littlefieldImage"))
    
    let musicHallWburg = Venues(name: "Music Hall of Willasmburg",
                                address: "66 N 6th St. Brooklyn, NY 11211",
                                number: "718-486-5400",
                                url: "http://musichallofwilliamsburg.com/",
                                description: "The Music Hall of Williamsburg (formerly known as Northsix) is located in the Williamsburg neighborhood of Brooklyn. The venue is operated by The Bowery Presents, a group stemming from Bowery Ballroom. It has a capacity of 550 people and has shows on most nights of the week. (photo by Rafe Baron)",
                                image: #imageLiteral(resourceName: "musichallofwilliamsburgImage"))
    
    let nitehawk = Venues(name: "Nitehawk Cinema",
                          address: "136 Metropolitan Ave. Brooklyn, NY 11249",
                                number: "718-782-8370",
                                url: "http://nitehawkcinema.com/",
                                description: "Nitehawk Cinema is New York’s premier dine-in theater, pairing exemplary first-run and repertory film programming along with tableside food and beverage service.",
                                image: #imageLiteral(resourceName: "nitehawkImage"))
    
    let pineBox = Venues(name: "Pine Box Rock Shop",
                         address: "12 Grattan St. Brooklyn, NY 11206",
                                number: "718-366-6311",
                                url: "http://pineboxrockshop.com/",
                                description: "Since June 2011, Pine Box Rock Shop has been hosting some of the very best local and touring live music, theater, comedy and film screenings in our professionally-designed and equipped event space.",
                                image: #imageLiteral(resourceName: "pineboxImage"))
    
    let theShanty = Venues(name: "The Shanty at NY Distilling",
                           address: "79 Richardson St. Brooklyn, NY 11222",
                                number: "718-878-3579",
                                url: "http://nydistilling.com/",
                                description: "Craft cocktails from a cozy saloon in a distillery with exposed brick & views of the machinery.",
                                image: #imageLiteral(resourceName: "theshantyImage"))
    
    let threesBrewing = Venues(name: "Threes Brewing",
                               address: "333 Douglass St. Brooklyn, NY 11217",
                                number: "718-522-2110",
                                url: "http://threesbrewing.com/",
                                description: "Threes Brewing is a brewery, bar & event space located in Gowanus, Brooklyn.",
                                image: #imageLiteral(resourceName: "threesbrewingImage"))
    
    let unionHall = Venues(name: "Union Hall",
                           address: "702 Union St. Brooklyn, NY 11215",
                                number: "718-638-4400",
                                url: "http://unionhallny.com/",
                                description: "Union Hall is a 5000 square foot bar, restaurant and live music and comedy venue in the heart of Park Slope, Brooklyn.  (photo by Dee Guerreros aka Dee Shoots)",
                                image: #imageLiteral(resourceName: "unionhallImage"))
    
    let unionPool = Venues(name: "Union Pool",
                           address: "484 Union Ave. Brooklyn, NY 11211",
                                number: "718-609-0484",
                                url: "http://union-pool.com/",
                                description: "Popular bar set in a former pool supply store with live music & a taco truck in the backyard. (photo by Rafe Baron)",
                                image: #imageLiteral(resourceName: "unionpoolImage"))

    init(){
        allVenues.append(sixtyOneLocalVenue)
        allVenues.append(annoyanceTheatreNYVenue)
        allVenues.append(barMatchless)
        allVenues.append(theBellHouse)
        allVenues.append(brookynBrewery)
        allVenues.append(dizzys)
        allVenues.append(duckDuck)
        allVenues.append(theGutter)
        allVenues.append(knittingFactory)
        allVenues.append(littleField)
        allVenues.append(musicHallWburg)
        allVenues.append(nitehawk)
        allVenues.append(pineBox)
        allVenues.append(theShanty)
        allVenues.append(threesBrewing)
        allVenues.append(unionHall)
        allVenues.append(unionPool) 
    }
}

