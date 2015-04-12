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
        }
    }
    
    
    func amountInCart(item: Item) -> Int
    {
        let itemID = item.id
        if let item = cart[itemID] {
            return item
        } else {
            return 0
        }
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