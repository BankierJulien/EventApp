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
}

class EventsAndSchedualViewController: UIViewController {
    
    @IBOutlet weak var dayPickerCollectionView: UICollectionView!
    @IBOutlet weak var eventTableView: UITableView!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    let events = EventManager()
    var currentDay = 1
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
        self.dayPickerCollectionView.dataSource = self
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self
        
        //populate events by day
        //print(events.mondayEvents)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : COLLECTION VIEW
extension EventsAndSchedualViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    //
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        cell.backgroundColor = UIColor.black
        // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentDay = indexPath.row
        print(self.currentDay)
    }
}


extension EventsAndSchedualViewController : UICollectionViewDelegateFlowLayout {
    
}

//MARK: TableView


extension EventsAndSchedualViewController : UITableViewDelegate{
    
}

extension EventsAndSchedualViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.mondayEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        cell.textLabel?.text = events.mondayEvents[indexPath.row].name
        return cell
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
