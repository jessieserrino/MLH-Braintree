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
    
    init() {

    }
    
    func addToCart(item: Item)
    {
        let itemID = item.id
        if let item = cart[itemID] {
            cart[itemID] = item + 1
        } else {
            cart[itemID] = 1
        }    }
    
    
    func inCart(item: Item) -> Bool
    {

    }
    
    /*func addToCart (itemIDs: [Int]) {
        for itemID in itemIDs {
            if let item = cart[itemID] {
                cart[itemID] = item + 1
            } else {
                cart[itemID] = 1
            }
        }
    }*/
}