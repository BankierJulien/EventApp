//
//  VenueDetailViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 5/30/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VenueDetailViewController: UIViewController {
    //CHANGE DESCRIPTION TO A SCROLL VIEW
    //USE KINGFISHR FOR IMAGES
    
    @IBOutlet var venueImage: UIImageView!
    @IBOutlet var venueName: UILabel!
    @IBOutlet var venueAddress: UILabel!
    @IBOutlet var venueNumber: UILabel!
    @IBOutlet var venueDescription: UILabel!
    @IBOutlet var imageNameLabel: UILabel!
    @IBOutlet var urlButton: UIButton!
    @IBOutlet var venueMapView: MKMapView!

    var passedImage = UIImage()
    var selectedVenue = Venues(name: "", address: "", number: "", url: "", description: "", imageString: "")
    var imageString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "BK Comedy Fest Venues"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.venueImage.image = self.passedImage
        self.venueName.text = self.selectedVenue.name
        self.venueNumber.text = self.selectedVenue.number
        self.venueDescription.text = self.selectedVenue.description
        self.venueAddress.text = self.selectedVenue.address
        self.imageNameLabel.text = self.selectedVenue.name
        self.urlButton.setTitle(self.venueName.text! + ".com", for: UIControlState.normal)
        self.setUpMapViewWithAddress(addressString: self.selectedVenue.address)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: URL FUNCTIONS
    @IBAction func urlButtonPressed(_ sender: UIButton) {
        let stringWithHTTPPrepended = "http://\(String(describing: self.urlButton.title(for: .normal)!))".replacingOccurrences(of:" ", with: "")
        let url = URL(string: stringWithHTTPPrepended)
        UIApplication.shared.open(url!)
    }
    
    //MARK : MAPVIEW FUNCTIONS
    func setUpMapViewWithAddress(addressString:String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            let venueCoordinates = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
            let regionRadius: CLLocationDistance = 100
            
            func centerMapOnLocation(location: CLLocation) {
                let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                          regionRadius * 2.0, regionRadius * 2.0)
                self.venueMapView.setRegion(coordinateRegion, animated: false)
            }
            self.addPinAtLocation(location: venueCoordinates)
            self.focusMapViewAtLocation(location: venueCoordinates)
            centerMapOnLocation(location: CLLocation(latitude: venueCoordinates.latitude, longitude: venueCoordinates.longitude))
        }
    }
    
    func addPinAtLocation(location:CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        let centerCoordinate = location
        annotation.coordinate = centerCoordinate
        annotation.title = self.selectedVenue.name
        self.venueMapView.addAnnotation(annotation)
    }
    
    func focusMapViewAtLocation(location:CLLocationCoordinate2D) {
        let mapCenter = location
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(mapCenter, span)
        self.venueMapView.region = region
    }
}

