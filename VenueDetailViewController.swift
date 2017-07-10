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
    @IBOutlet var venueDescription: UILabel!
    @IBOutlet var imageNameLabel: UILabel!
    @IBOutlet var urlButton: UIButton!
    @IBOutlet var venueMapView: MKMapView!
    @IBOutlet var venueNumber: UIButton!
    @IBOutlet var backToVenueTableViewButton: UIBarButtonItem!
    
    var selectedVenue = Venues(name: "", address: "", number: "", url: "", description: "", image: UIImage())
    var imageString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.configureFlatNavigationBar(with: UIColor.midnightBlue())
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.view.backgroundColor = UIColor.midnightBlue()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.venueNumber.setTitle(self.selectedVenue.number, for: .normal)
        self.urlButton.setTitle( self.formateStringForDisplay(webString: self.selectedVenue.url), for: UIControlState.normal)
        self.venueImage.image = self.selectedVenue.image
        self.venueName.text = self.selectedVenue.name
        self.venueDescription.text = self.selectedVenue.description
        self.venueAddress.text = self.selectedVenue.address
        self.imageNameLabel.text = self.selectedVenue.name
        self.setUpMapViewWithAddress(addressString: self.selectedVenue.address)
        self.navigationController?.title = self.selectedVenue.name

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBACTIONS
    @IBAction func urlButtonPressed(_ sender: UIButton) {
        let stringWithHTTPPrepended = "http://\(String(describing: self.urlButton.title(for: .normal)!))".replacingOccurrences(of:" ", with: "")
        let url = URL(string: stringWithHTTPPrepended)
        UIApplication.shared.open(url!)
    }
    
    @IBAction func phoneNumberTapped(_ sender: UIButton) {
        if let url = URL(string: "tel://\(self.formateStringForPhoneURL(numberString: self.selectedVenue.number))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
 
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    
    //MARK: STRING FORMATING
    
    func formateStringForPhoneURL(numberString: String) -> String{
        let newString = numberString.replacingOccurrences(of: "-", with: "")
        return newString
    }
    
    func formateStringForDisplay(webString: String) -> String{
        let removeHTTP = webString.replacingOccurrences(of: "http:", with: "")
        let newString = removeHTTP.replacingOccurrences(of: "/", with: "")
        return newString
    }
}

