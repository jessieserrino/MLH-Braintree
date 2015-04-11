//
//  Cart.swift
//  MLH-Braintree
//
//  Created by Giovanni Alcantara on 11/04/2015.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import Foundation
class Cart {
    var cart = [Int:Int]()
    
    init(itemIDs:[Int]) {
        for itemID in itemIDs {
            cart[itemID] = 1
        }
    }
    
    func addToCart (itemIDs: [Int]) {
        for itemID in itemIDs {
            if let item = cart[itemID] {
                cart[itemID] = item + 1
            } else {
                cart[itemID] = 1
            }
        }
    }
}