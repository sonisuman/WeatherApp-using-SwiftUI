//
//  Weather.swift
//  WeatherAPPExample
//
//  Created by Soni Suman on 26/12/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import Foundation

struct WeatherResponce: Codable {
    let main: Weather
}

struct Weather: Codable {
    var temp: Double?
    var humidity: Double?
}
