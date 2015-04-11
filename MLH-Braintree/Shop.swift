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
    
    
}