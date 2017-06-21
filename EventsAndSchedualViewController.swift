//
//  EventsAndSchedualViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/7/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit
import QuartzCore
import MessageUI

enum day: Int {
    case monday = 0
    case tuesday = 1
    case wednesday = 2
    case thursday = 3
    case friday = 4
    case saturday = 5
    case sunday = 6
    
}


class EventsAndSchedualViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet var dayContainerHeight: NSLayoutConstraint!
    @IBOutlet var dayCollectionView: UICollectionView!
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var uploadButton: UIBarButtonItem!
    
    let arrayOfDays = ["Mon","Tue","Wed", "Thur", "Fri", "Sat", "Sun"]
    var attendButton = UIButton()
    var dayButtonArray = [UIButton]()
    let events = EventManager()
    var currentDayEvents = [Events]()
    var myEvents = [Events]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // menu logic
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //tab bar set up
        self.tabBar.selectedItem = tabBar.items?[0]
        
        self.tabBar.delegate = self
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self
        self.currentDayEvents = self.events.mondayEvents
        self.dayCollectionView.dataSource = self
        self.dayCollectionView.delegate = self
        
        self.tabBar.items?.first?.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(red: 200/255, green: 64/255, blue: 50/255, alpha: 1.0) ], for: .selected)
        self.tabBar.items?.last?.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(red: 200/255, green: 64/255, blue: 50/255, alpha: 1.0) ], for: .selected)
        
        // select monday
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func formateEventsForText() -> String{
        var textMessage = String()
        let introString = "Hey, this is my schedual for the BK Comedy Festival, check it out:\n\n"
        if self.myEvents.isEmpty{
            print("tell them to add events")
        }
        else {
            textMessage.append(introString)
            for event in self.myEvents{
                let eventString = String(format:"%@ with %@ at %@ from %@ on %@ \n\n\n", event.headliner, event.openers, event.venue, event.time, event.date)
                textMessage.append(eventString)
            }
            
        }
        return textMessage
    }
    
    @IBAction func textSchedualPressed(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() == true {
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate  = self
            messageController.body = self.formateEventsForText()
            self.present(messageController, animated: true, completion: nil)
        }
        else {
            print("failed")
            //pop up alert not cant send message
            //handle text messaging not available
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
        if self.tabBar.selectedItem?.tag == 0 {
            return self.currentDayEvents.count
        }
        else {
            return self.myEvents.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        
        let buttonWidth: CGFloat = 40
        
        self.attendButton = UIButton(frame: CGRect(x:cell.frame.size.width - buttonWidth, y:cell.frame.size.height/2 - buttonWidth, width:buttonWidth, height:buttonWidth))
        self.attendButton.addTarget(self, action: #selector(didPressAttendButton(sender:)), for: .touchUpInside)
        self.attendButton.tag = indexPath.row
        self.attendButton.backgroundColor = UIColor.black
        self.attendButton.isUserInteractionEnabled = true
        
        if self.tabBar.selectedItem?.tag == 0 {
            cell.eventPerformer.text = self.currentDayEvents[indexPath.row].headliner
            cell.eventOpeners.text = self.currentDayEvents[indexPath.row].openers
            cell.eventTime.text = self.currentDayEvents[indexPath.row].time
            cell.eventVenue.text = self.currentDayEvents[indexPath.row].venue
            cell.eventImage.image = self.currentDayEvents[indexPath.row].eventImage
            cell.addSubview(self.attendButton)
//            cell.sendSubview(toBack: cell.eventImage)

        }
        else {
            self.attendButton.setImage(#imageLiteral(resourceName: "remove"), for: .normal)
            cell.eventPerformer.text = self.myEvents[indexPath.row].headliner
            cell.eventOpeners.text = self.myEvents[indexPath.row].openers
            cell.eventTime.text = self.myEvents[indexPath.row].time
            cell.eventVenue.text = self.myEvents[indexPath.row].venue
            cell.eventImage.image =  self.myEvents[indexPath.row].eventImage
            cell.addSubview(self.attendButton)

        }
        
        return cell
    }
    
    
    func didPressAttendButton(sender:UIButton) {
        
        if self.tabBar.selectedItem?.tag == 0 {
            //self.attendButton.updateConstraintsIfNeeded()
            self.attendButton.backgroundColor = UIColor.red

            self.attendButton.setImage(#imageLiteral(resourceName: "remove"), for: .normal)
            self.addEventToSchedual(eventIndex: sender.tag)
        }
        else {
            self.attendButton.backgroundColor = UIColor.green

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
    
    func keyExists(userDefaultsKey: String) -> Bool {
        return UserDefaults.standard.object(forKey: userDefaultsKey) != nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEventDetail" {
            let detailVC = segue.destination as! EventDetailViewController
            let indexPath = self.eventTableView.indexPathForSelectedRow!
            let row = indexPath.row
            if self.tabBar.selectedItem?.tag == 0{
                detailVC.selectedEvent = self.currentDayEvents[row]
            }
            else {
                detailVC.selectedEvent = self.myEvents[row]
            }
        }
    }
}

//MARK : TABBAR

extension EventsAndSchedualViewController : UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag != 0 {
            if self.keyExists(userDefaultsKey: "myEvents"){
                let storedEvents = self.loadArrayFromUserDefaults()
                if !storedEvents.isEmpty{
                    self.myEvents = storedEvents
                }
            }
            else {
                print("put empty thign here")
            }
            self.navigationController?.title = "My Schedual"
            self.dayContainerHeight.constant = 0
        }
        else{
            self.navigationController?.title = "All Events"
            self.dayContainerHeight.constant = 60
        }
        self.eventTableView.reloadData()
    }
}

extension EventsAndSchedualViewController : MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension EventsAndSchedualViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath as IndexPath)!
        cell.backgroundColor = UIColor(red: 200/255, green: 64/255, blue: 50/255, alpha: 1.0)
        
        switch indexPath.row {
        case day.monday.rawValue:
            self.currentDayEvents = self.events.mondayEvents
            break
            
        case day.tuesday.rawValue:
            self.currentDayEvents = self.events.tuesdayEvents
            break
            
        case day.wednesday.rawValue:
            self.currentDayEvents = self.events.wednesdayEvents
            break
            
        case day.thursday.rawValue:
            self.currentDayEvents = self.events.thursdayEvents
            break
            
        case day.friday.rawValue:
            self.currentDayEvents = self.events.thursdayEvents
            break
            
        case day.saturday.rawValue:
            self.currentDayEvents = self.events.thursdayEvents
            break
            
        case day.sunday.rawValue:
            self.currentDayEvents = self.events.thursdayEvents
            break
            
        default:
            self.currentDayEvents = self.events.mondayEvents
            break
        }
        
        self.eventTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath as IndexPath)!
        cell.backgroundColor = UIColor.clear
    }
}

extension EventsAndSchedualViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"dayCell", for: indexPath) as! DayCollectionViewCell
        cell.dayLabel.text = arrayOfDays[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 2.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayOfDays.count
    }
    
}

