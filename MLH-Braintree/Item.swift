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
    var description: String
    
    init(id: Int, price: Double, description: String, image:String) {
        self.id = id
        self.price = price
        self.description = description
        self.image = image
    }
}