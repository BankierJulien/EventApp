//
//  EventsAndSchedualViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/7/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit
import QuartzCore

enum day: Int {
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
    
}

class EventsAndSchedualViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet var dayContainerView: UIView!
    @IBOutlet var dayContainerHeight: NSLayoutConstraint!
    
    @IBOutlet var mondayButton: UIButton!
    @IBOutlet var tuesdayButton: UIButton!
    @IBOutlet var wednesdayButton: UIButton!
    @IBOutlet var thursdayButton: UIButton!
    @IBOutlet var fridayButton: UIButton!
    @IBOutlet var saturdayButton: UIButton!
    @IBOutlet var sundayButton: UIButton!
    
    var attendButton = UIButton()
    
    var dayButtonArray = [UIButton]()
    let events = EventManager()
    var currentDayEvents = [Events]()
    var myEvents = [Events]()
    // MARK : add events to your scehdaul, see them based on day, go to detail view of event, buy tickets from site if indiviually bought, empty message + animations if nothing there,
    
    //MARK : TO DO : add all functionaltiy here, make setial view for events, add animating sponsers on menu, add log in? ( but why) , persists choices, add map view to venue, find a way to scrapper it? figure out image loading
    
    @IBOutlet var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dayButtonArray.append(mondayButton)
        self.dayButtonArray.append(tuesdayButton)
        self.dayButtonArray.append(wednesdayButton)
        self.dayButtonArray.append(thursdayButton)
        self.dayButtonArray.append(fridayButton)
        self.dayButtonArray.append(saturdayButton)
        self.dayButtonArray.append(sundayButton)
        self.setUpButtons()
        
        // menu logic
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //tab bar set up
        self.tabBar.selectedItem = tabBar.items?[0]
        // maybe not nessasry?
        self.tabBar.delegate = self
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self
        self.currentDayEvents = self.events.mondayEvents
        
        for button in self.dayButtonArray{
            button.addTarget(self, action:#selector(didPressDayButton(sender:)), for: .touchUpInside)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPressDayButton(sender:UIButton) {
        if sender == self.mondayButton{
            self.currentDayEvents = self.events.mondayEvents
        }
        else if sender == self.tuesdayButton{
            self.currentDayEvents = self.events.tuesdayEvents
        }
        self.eventTableView.reloadData()
    }
    
    func setUpButtons(){
        for button in self.dayButtonArray{
            button.layer.cornerRadius = 4.0
            button.layer.masksToBounds = true
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
}


//MARK: TableView
extension EventsAndSchedualViewController : UITableViewDelegate{
    
}

extension EventsAndSchedualViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // MARK : MUST BE AN EASIER WAY
        if self.tabBar.selectedItem?.tag == 0 {
            return self.currentDayEvents.count
        }
        else {
            return self.myEvents.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        
//        self.attendButton = UIButton(frame: CGRect(x:0, y:0, width:30, height:30))
//        self.attendButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)
//       // self.attendButton.backgroundColor = UIColor.white
//        self.attendButton.addTarget(self, action: #selector(didPressAttendButton(sender:)), for: .touchUpInside)
//      //  cell.accessoryView = self.attendButton;
//        self.attendButton.tag = indexPath.row
        
        if self.tabBar.selectedItem?.tag == 0 {
            //def easier way to do this
            cell.eventPerformer.text = self.currentDayEvents[indexPath.row].headliner
            cell.eventOpeners.text = self.currentDayEvents[indexPath.row].openers
            cell.eventTime.text = self.currentDayEvents[indexPath.row].time
            cell.eventVenue.text = self.currentDayEvents[indexPath.row].venue
            cell.eventImage.image = #imageLiteral(resourceName: "SplashPage")
        }
        else {
            self.attendButton.setImage(#imageLiteral(resourceName: "remove"), for: .normal)
            cell.eventPerformer.text = self.myEvents[indexPath.row].headliner
            cell.eventOpeners.text = self.myEvents[indexPath.row].openers
            cell.eventTime.text = self.myEvents[indexPath.row].time
            cell.eventVenue.text = self.myEvents[indexPath.row].venue
            cell.eventImage.image = #imageLiteral(resourceName: "SplashPage")
        }
        
        return cell
    }
    
    
    func didPressAttendButton(sender:UIButton) {
  
        if self.tabBar.selectedItem?.tag == 0 {
            self.attendButton.updateConstraintsIfNeeded()
            self.addEventToSchedual(eventIndex: sender.tag)
        }
        else {
            self.attendButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)

            self.removeEventFromSchedual(eventIndex: sender.tag)
        }
        self.eventTableView.reloadData()
    }
    
    // MARK: Array Logic and User Deaults logic
    
    func addEventToSchedual(eventIndex: Int){
        self.myEvents.append(self.currentDayEvents[eventIndex])
        self.removeDupliactesFromMyEvents(array: self.myEvents)
        self.saveArrayToUserDefaults(array: self.myEvents)
    }
    
    func removeEventFromSchedual(eventIndex:Int){
        self.myEvents.remove(at: eventIndex)
        self.saveArrayToUserDefaults(array: self.myEvents)
    }
    
    func removeDupliactesFromMyEvents(array: Array<Events>){
        let filteredElements = self.myEvents.filterDuplicates { $0.id == $1.id }
        self.myEvents = filteredElements
    }
    
    func saveArrayToUserDefaults(array:Array<Events>){
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self.myEvents)
        userDefaults.set(encodedData, forKey: "myEvents")
        userDefaults.synchronize()
    }
    
    func loadArrayFromUserDefaults() -> Array<Events>{
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: "myEvents") as! Data
        let decodedArrays = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Events]
        return decodedArrays
    }
    
    
    
}

//MARK : TABBAR

extension EventsAndSchedualViewController : UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.tag != 0 {
            let storedEvents = self.loadArrayFromUserDefaults()
            if !storedEvents.isEmpty{
                self.myEvents = storedEvents
            }
            else {
                print("put empty thign here")
            }
            // animate this
            self.dayContainerHeight.constant = 0
            self.view.updateConstraintsIfNeeded()
        }
        else{
            self.dayContainerHeight.constant = 42
            self.view.updateConstraintsIfNeeded()
        }
        
        
        self.eventTableView.reloadData()
    }
    
    
}
