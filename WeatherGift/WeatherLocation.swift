//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Laird Connor Stephen Marlin I, Exquire on 6/24.
//  Copyright © 2019 Laird Connor Stephen Marlin I, Exquire. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
