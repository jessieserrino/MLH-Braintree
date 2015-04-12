//
//  ShopListViewController.swift
//  MLH-Braintree
//
//  Created by Jessie Serrino on 4/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import UIKit
import CoreLocation

class ShopListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items =
    [1412:"Item in beacon 1412",
        11617:"Item in beacon 11617",
        36593:"Item in beacon 36593"]
    
    var beacon : Int? {
        didSet {
            menuTableView.reloadData()
        }
    }
    
    @IBOutlet var menuSearchBar: UISearchBar!

    @IBOutlet weak var menuTableView: UITableView! {
        didSet {
            menuTableView.delegate = self
            menuTableView.dataSource = self
            menuTableView.registerNib(UINib(nibName: "ShopListTableViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
            menuTableView.backgroundColor = UIColor.clearColor()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ShopListTableViewCell = menuTableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ShopListTableViewCell
        if let currentBeacon = beacon {
            cell.itemImageView?.image = UIImage(named: "Cart")
            cell.itemNameLabel?.text = items[currentBeacon];
            cell.itemPriceLabel?.text = "$99"
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let appDelegate = UIApplication.sharedApplication().delegate
        // Do any additional setup after loading the view.
        
        center.addObserverForName("Closest Beacon Center", object: appDelegate, queue: queue) { notification in
            if let newBeacon = notification?.userInfo?["Beacon"] as? CLBeacon {
                self.beacon = newBeacon.major.integerValue
                
                var localNotification:UILocalNotification = UILocalNotification()
                localNotification.alertAction = "shop"
                var shopName: String?
                switch newBeacon.major {
                case 1412:
                    shopName = "Giovanni's Italian Restaurant"
                case 11617:
                    shopName = "H&M"
                case 36593:
                    shopName = "King's Cross Station"
                default:
                    break;
                }
                
                if let name = shopName {
                    localNotification.alertBody = "Welcome to \(name)! Just swipe to start shopping."
                    localNotification.fireDate = NSDate(timeIntervalSinceNow: 0.5)
                    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Getting the search going
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
