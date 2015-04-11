//
//  Shop.swift
//  MLH-Braintree
//
//  Created by Giovanni Alcantara on 11/04/2015.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import Foundation

class Shop {
    var beacon: Beacon
    var name: String
    final var id: Int
    
    init(beacon: Beacon, name: String, id: Int) {
        self.beacon = beacon
        self.name = name
        self.id = id
    }
}