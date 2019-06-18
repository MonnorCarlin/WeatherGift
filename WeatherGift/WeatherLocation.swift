//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Laird Connor Stephen Marlin I, Exquire on 6/17.
//  Copyright © 2019 Laird Connor Stephen Marlin I, Exquire. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double { // doesn't work properly (kinda does)
                    print("***** TEMP inside getWeather = \(temperature)")
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return a temperature")
                }
                if let summary = json["daily"]["summary"].string { // couldn't get this to work
                    self.currentSummary = summary
                } else {
                    print("Could not return a summary")
                }
            case .failure(let error):
                print(error)
            }
        }
        completed()
    }
}
