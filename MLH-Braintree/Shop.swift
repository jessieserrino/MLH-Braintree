//
//  Shop.swift
//  MLH-Braintree
//
//  Created by Giovanni Alcantara on 11/04/2015.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import Foundation
import CoreLocation

class Shop {
    var beacon: CLBeacon
    var name: String
    final var id: Int
    
    init(beacon: CLBeacon, name: String, id: Int) {
        self.beacon = beacon
        self.name = name
        self.id = id
    }
    
    
    class func shopItems(shopNumber: Int) -> NSMutableArray
    {
        let shopArray = NSMutableArray()
        
        let items = []
        
        switch(shopNumber)
        {
            case 1412:
                let items = [[1, "Calamari", 9.00], [2, "Filet splendito", 14.00], [3, "Mozzarella", 7.45], [4, "Chicken salad", 10.00], [5, "Margherita", 5.00]]
                for item in items
                {
                    shopArray.addObject(Item(id: item[0] as! Int, price: item[2] as! Double, description: item[1] as! String, image: String(format: "%li_%li", shopNumber, item[0] as! Int)))
                }
                break;
            case 11617:
                var items = [[1, "Jersey Dress", 12.95], [2, "Nep Jersey", 9.95], [3, "Denim Shorts", 19.95], [4, "Men's Cap Toe", 100.52], [5, "Blazer Slim fit", 69.95]]

                for item in items
                {
                    shopArray.addObject(Item(id: item[0] as! Int, price: item[2] as! Double, description: item[1] as! String, image: String(format: "%li_%li", shopNumber, item[0] as! Int)))
                }
                break;
            case 36593:
                var items = [[1, "Bristol", 62.00], [2, "Birmingham", 38.80], [3, "Liverpool", 87.60], [4, "Manchester", 89.30], [5, "Edinburgh", 134.20]]
                for item in items
                {
                    shopArray.addObject(Item(id: item[0] as! Int, price: item[2] as! Double, description: item[1] as! String, image: String(format: "%li_%li", shopNumber, item[0] as! Int)))
                }
                break;
            default:
                break;
        }

//        var items = [[1, "Calamari", 9.00], [2, "Filet splendito", 14.00], [3, "Mozzarella marinara", 7.45], [4, "Parmesan crusted chicken salad", 10.00], [5, "Margherita", 5.00]]
//        var items = [[1, "Jersey Dress", 12.95], [2, "Nep Jersey T-shirt", 9.95], [3, "Denim Shorts", 19.95], [4, "Men's Johnston & Murphy Atchison Cap Toe", 100.52], [5, "Blazer Slim fit", 69.95]]
//        var items3 = [[1, "Bristol", 62.00], [2, "Birmingham", 38.80], [3, "Liverpool", 87.60], [4, "Manchester", 89.30], [5, "Edinburgh", 134.20]]

        
//        for item in items3
//        {
//            shopArray.addObject(Item(id: item[0] as! Int, price: item[2] as! Double, description: item[1] as! String, image: String(format: "%li_%li", shopNumber, item[0] as! Int)))
//        }
        
        
        
        return shopArray
    }
    
}