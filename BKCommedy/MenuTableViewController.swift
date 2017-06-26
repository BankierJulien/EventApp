//
//  MenuTableViewController.swift
//  BKCommedy
//
//  Created by Julien Bankier on 6/14/17.
//  Copyright © 2017 Julien Bankier. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    @IBOutlet var blurView: UIView!
    @IBOutlet var sponsersImageView: UIImageView!
    var index = 0
    var sponserImageArray = [#imageLiteral(resourceName: "leafly"), #imageLiteral(resourceName: "ifc"), #imageLiteral(resourceName: "iceBreakers"), #imageLiteral(resourceName: "theWilliamVale"), #imageLiteral(resourceName: "826NYC"), #imageLiteral(resourceName: "marbles"), #imageLiteral(resourceName: "sixPoint")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         _ = Timer.scheduledTimer(timeInterval: 3, target: self,  selector:(#selector(fadeImage)), userInfo: nil, repeats: true)
        
        let blur = UIBlurEffect(style: .light)
        let blurEffect = UIVisualEffectView(effect: blur)
        blurEffect.frame = blurView.bounds
        blurView.addSubview(blurEffect)
        blurView.sendSubview(toBack: blurEffect)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.bounds.size.width, height: 20))
        if section == 0{
            headerView.backgroundColor = UIColor.midnightBlue()
            titleLabel.text = "BK Comedy Festival"
            titleLabel.textColor = UIColor.white
            headerView.addSubview(titleLabel)
        }
        else if section == 1{
            headerView.backgroundColor = UIColor.midnightBlue()
            titleLabel.text = "Sponsers"
            titleLabel.textColor = UIColor.white
            headerView.addSubview(titleLabel)
        }
        return headerView
    }
    

    func fadeImage() {
        index = index < self.sponserImageArray.count - 1 ? index + 1: 0
        self.sponsersImageView.image = self.sponserImageArray[index]
        self.sponsersImageView.slideInFromRight(duration: 1, completionDelegate: nil)
    }
}
