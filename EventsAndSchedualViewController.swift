//
//  EventsAndSchedualViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/7/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

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
    
    //    @IBOutlet weak var dayPickerCollectionView: UICollectionView!
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    
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
        
        self.attendButton = UIButton(frame: CGRect(x:0, y:0, width:50, height:50))
        self.attendButton.setImage(#imageLiteral(resourceName: "empty"), for: .normal)
        self.attendButton.addTarget(self, action: #selector(didPressAttendButton(sender:)), for: .touchUpInside)
        cell.accessoryView = self.attendButton;
        self.attendButton.tag = indexPath.row
        
        // MARK : MUST BE AN EASIER WAY
        
        if self.tabBar.selectedItem?.tag == 0 {
            //def easier way to do this
            cell.eventPerformer.text = self.currentDayEvents[indexPath.row].name
            cell.eventTime.text = self.currentDayEvents[indexPath.row].time
            cell.eventVenue.text = self.currentDayEvents[indexPath.row].venue
            cell.eventImage.image = #imageLiteral(resourceName: "SplashPage")
        }
        else {
            cell.eventPerformer.text = self.myEvents[indexPath.row].name
            cell.eventTime.text = self.myEvents[indexPath.row].time
            cell.eventVenue.text = self.myEvents[indexPath.row].venue
            cell.eventImage.image = #imageLiteral(resourceName: "SplashPage")
        }
        
        return cell
    }
    
    
    func didPressAttendButton(sender:UIButton) {
        //fix this if it dsnt work
        
        
        //remove duplicates
        if self.tabBar.selectedItem?.tag == 0 {
            self.attendButton.setImage(#imageLiteral(resourceName: "checked"), for: .selected)
            sender.isSelected = !sender.isSelected
            self.myEvents.append(self.currentDayEvents[sender.tag])
        }
        else {
            self.attendButton.setImage(#imageLiteral(resourceName: "close"), for: .normal)
            sender.isSelected = !sender.isSelected
            self.myEvents.remove(at: sender.tag)
            self.eventTableView.reloadData()
        }
    }
}

//MARK : TABBAR

extension EventsAndSchedualViewController : UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        for event in self.myEvents{
            print(event.name)
        }
        self.removeDuplicates(array: self.myEvents)
        for event in self.myEvents{
            print(event.name)
        }
        self.eventTableView.reloadData()
    }
    //MARK:  find a way to remove duplicates
    func removeDuplicates(array: [Events]) {
        for event in array {
        }
    }
    
}
