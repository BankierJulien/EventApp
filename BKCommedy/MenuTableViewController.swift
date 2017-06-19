//
//  MenuTableViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/14/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.bounds.size.width, height: 20))
        if section == 0{
            headerView.backgroundColor = UIColor.black
            titleLabel.text = "BK Comedy Festival"
            titleLabel.textColor = UIColor.white
            headerView.addSubview(titleLabel)
        }
        else if section == 1{
            headerView.backgroundColor = UIColor.black
            titleLabel.text = "Sponsers"
            titleLabel.textColor = UIColor.white
            headerView.addSubview(titleLabel)
        }
        return headerView
    }
}
