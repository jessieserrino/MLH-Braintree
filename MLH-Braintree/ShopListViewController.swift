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

    
    var shopItems : NSMutableArray? {
        didSet {
            menuTableView.reloadData()
        }
    }

    
    var anotherModalViewIsVisible = false;
    
    var beacon : Int?
    
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
        return 1
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ShopListTableViewCell = menuTableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! ShopListTableViewCell
        if let currentBeacon = beacon {
            let item = self.shopItems!.objectAtIndex(indexPath.item) as! Item

            cell.itemImageView?.image = UIImage(named: item.image)
            cell.itemNameLabel?.text = item.description //"\(items[indexPath.row][1])"
            cell.itemPriceLabel?.text = String(format: "%.2f£", item.price)
            cell.itemQuantityLabel?.text = String(format: "%i",  12)
        }
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let appDelegate = UIApplication.sharedApplication().delegate
        
        center.addObserverForName("Closest Beacon Center", object: appDelegate, queue: queue) { notification in
            if let newBeacon = notification?.userInfo?["Beacon"] as? CLBeacon {
                self.beacon = newBeacon.major.integerValue
                
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
                    var state = UIApplication.sharedApplication().applicationState
                    if state == UIApplicationState.Active {
                        
                        if !self.anotherModalViewIsVisible {
                            let view = ModalView.instantiateFromNib("ModalView2")
                            view.titleLabel.text = "Welcome to \(name)"
                            let window = UIApplication.sharedApplication().delegate?.window!
                            let modal = PathDynamicModal()
                            modal.showMagnitude = 200.0
                            modal.closeMagnitude = 130.0
                            view.closeButtonHandler = {[weak modal] in
                                self.anotherModalViewIsVisible = false
                                self.menuTableView.reloadData()
                                modal?.closeWithLeansRandom()
                                return
                            }
                            view.bottomButtonHandler = {[weak modal] in
                                self.anotherModalViewIsVisible = false
                                modal?.closeWithLeansRandom()
                                return
                            }
                            modal.show(modalView: view, inView: window!)
                            self.anotherModalViewIsVisible = true
                        } else {
                            
                        }
                    }
                    
                    var localNotification:UILocalNotification = UILocalNotification()
                    localNotification.alertAction = "shop"
                    localNotification.alertBody = "Welcome to \(name)! Just swipe to start shopping."
                    localNotification.fireDate = NSDate(timeIntervalSinceNow: 0.5)
                    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
                    
                    
                    self.shopItems = Shop.shopItems(self.beacon!)
                }

            }
        }
    }
    
    // Getting the search going
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)

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
