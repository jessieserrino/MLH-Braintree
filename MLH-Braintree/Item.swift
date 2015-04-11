//
//  Item.swift
//  MLH-Braintree
//
//  Created by Giovanni Alcantara on 11/04/2015.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import Foundation

class Item {
    final var id: Int
    var image: String
    var price: Double
    var shopID: Int
    
    init(id: Int, price: Double, shopID: Int, image:String) {
        self.id = id
        self.price = price
        self.shopID = id
        self.image = image
    }
}