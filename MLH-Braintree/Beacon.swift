//
//  Beacon.swift
//  MLH-Braintree
//
//  Created by Giovanni Alcantara on 11/04/2015.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import Foundation

class Beacon {
    var UUID: String
    final var major: Int
    final var minor: Int
    
    init(UUID: String, major: Int, minor: Int) {
        self.UUID = UUID
        self.minor = minor
        self.major = major
    }
    
}