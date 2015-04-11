//
//  TabViewController.swift
//  MLH-Braintree
//
//  Created by Jessie Serrino on 4/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import UIKit



class TabViewController: UIViewController, UITabBarDelegate {

    @IBOutlet var shopCartView: UIView!
    @IBOutlet var shopTabBar: UITabBar!
    @IBOutlet var tabNavigationBar: UINavigationItem!
    @IBOutlet var shopListView: UIView!
    var selectedItem: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shopTabBar.delegate = self
        self.shopTabBar.selectedItem = self.shopTabBar.items![0] as! UITabBarItem
        toggleToItem(self.shopTabBar.selectedItem!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        toggleToItem(item)
    }
    
    func toggleToItem(item: UITabBarItem)
    {
        self.shopCartView.hidden = (item.title == "Shop List")
        self.shopListView.hidden = !self.shopCartView.hidden
        self.tabNavigationBar.title = item.title
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
