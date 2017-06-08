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
    @IBOutlet var sudayButton: UIButton!
    
    let events = EventManager()
    var currentDay = 1
    var myEvents = [Events]()
    // MARK : add events to your scehdaul, see them based on day, go to detail view of event, buy tickets from site if indiviually bought, empty message + animations if nothing there,
    
    //MARK : TO DO : add all functionaltiy here, make setial view for events, add animating sponsers on menu, add log in? ( but why) , persists choices, add map view to venue, find a way to scrapper it? figure out image loading
    
    @IBOutlet var menuButton: UIBarButtonItem!
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
        
        // maybe not nessasry?
        self.tabBar.delegate = self
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self
        
        self.mondayButton.addTarget(self, action:#selector(didPressDayButton(sender:)), for: .touchUpInside)
        self.tuesdayButton.addTarget(self, action:#selector(didPressDayButton(sender:)), for: .touchUpInside)


    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPressDayButton(sender:UIButton) {
        if sender == self.mondayButton{
            self.currentDay = day.monday.rawValue
        }
        else if sender == self.tuesdayButton{
            self.currentDay = day.tuesday.rawValue
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
        if self.currentDay == day.monday.rawValue{
            return events.mondayEvents.count
        }
        else if self.currentDay == day.tuesday.rawValue{
            return 1
        }
        else {
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        let attendButton = UIButton(frame: CGRect(x:0, y:0, width:50, height:50))
        attendButton.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        attendButton.addTarget(self, action: #selector(didPressAttendButton(sender:)), for: .touchUpInside)
        cell.accessoryView = attendButton;
        attendButton.tag = indexPath.row
        cell.textLabel?.text = events.mondayEvents[indexPath.row].name
        return cell
    }
    
    func didPressAttendButton(sender:UIButton) {
        print(sender.tag)
    //    self.myEvents.append(<#T##newElement: Any##Any#>)
      
        
    }
    
}

//MARK : TABBAR

extension EventsAndSchedualViewController : UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag  {
        case 0:
            print("0")
            break
        case 1:
            print("1")
            break
      
        default:
            print("0")
            break
        }
    }
}
