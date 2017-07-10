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

//TO DO: Remvoe Seprotrs from venue page
//TO DO: dissmis hambuger menu on tap on active view
// MENU ICONS SHOULD HAVE SAME THICK NESS


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
        
        self.navigationController?.navigationBar.configureFlatNavigationBar(with: UIColor.midnightBlue())
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
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat-Bold", size: 20)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat-Bold", size: 20)!], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.alizarin()], for: .selected)
        
        NotificationCenter.default.addObserver(self, selector: #selector(hamburgerMenuDidOpen), name: Notification.Name("menuDidOpen"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hamburgerMenuDidClose), name: Notification.Name("menuDidClose"), object: nil)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func formateEventsForText() -> String{
        // maybe this should be on a dif thread at least the open text maessage part
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
    
    
    func hamburgerMenuDidOpen() {
        self.eventTableView.isUserInteractionEnabled = false
        self.tabBar.isUserInteractionEnabled = false
        self.dayCollectionView.isUserInteractionEnabled = false

    }
    
    func hamburgerMenuDidClose() {
        self.eventTableView.isUserInteractionEnabled = true
        self.tabBar.isUserInteractionEnabled = true
        self.dayCollectionView.isUserInteractionEnabled = true
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
 
        cell.addButton.addTarget(self, action: #selector(didPressAttendButton(sender:)), for: .touchUpInside)
        cell.addButton.tag = indexPath.row
        print(cell.addButton.isSelected)
//        cell.addButton.setImage(#imageLiteral(resourceName: "remove"), for: .selected)
//        cell.addButton.setImage(#imageLiteral(resourceName: "add"), for: .normal)

        
        if self.tabBar.selectedItem?.tag == 0 {
            cell.eventPerformer.text = self.currentDayEvents[indexPath.row].headliner
            cell.eventOpeners.text = self.currentDayEvents[indexPath.row].openers
            cell.eventTime.text = self.currentDayEvents[indexPath.row].time
            cell.eventVenue.text = self.currentDayEvents[indexPath.row].venue
            cell.eventImage.image = self.currentDayEvents[indexPath.row].eventImage
            
        }
        else {
            cell.eventPerformer.text = self.myEvents[indexPath.row].headliner
            cell.eventOpeners.text = self.myEvents[indexPath.row].openers
            cell.eventTime.text = self.myEvents[indexPath.row].time
            cell.eventVenue.text = self.myEvents[indexPath.row].venue
            cell.eventImage.image =  self.myEvents[indexPath.row].eventImage
            
        }
        
        return cell
    }
    
    
    func didPressAttendButton(sender:UIButton) {
        sender.isSelected = !sender.isSelected;
        
//        if sender.isSelected {
//            sender.tintColor = UIColor.alizarin()
//            
//        }
//        else {
//            sender.tintColor = UIColor.green
//            
//        }
//                            sender.tintColor = UIColor.alizarin()
//
//        sender.tintColor = UIColor.belizeHole()
//        print(sender.tag)
        
//        if self.myEvents.contains(cell for snder){
//        then remove it and set to +
        // else
        // add it and set to -

        

        
        if self.tabBar.selectedItem?.tag == 0 {
            sender.setImage(#imageLiteral(resourceName: "backButton"), for: .normal)
            self.addEventToSchedual(eventIndex: sender.tag)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "SplashOne"), for: .normal)
            self.removeEventFromSchedual(eventIndex: sender.tag)
        }
//        
//        self.eventTableView.reloadData()
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
        
        for cell in collectionView.visibleCells {
            if cell.isSelected {
                cell.backgroundColor = UIColor.alizarin()
            }
            else {
                cell.backgroundColor = UIColor.clear
            }
        }
        
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
    
}

extension EventsAndSchedualViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"dayCell", for: indexPath) as! DayCollectionViewCell
        
        if (indexPath.row == 0){
            cell.backgroundColor = UIColor.alizarin()
        }
        else {
            cell.backgroundColor = UIColor.clear
        }
        
        cell.dayLabel.text = arrayOfDays[indexPath.row]
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

