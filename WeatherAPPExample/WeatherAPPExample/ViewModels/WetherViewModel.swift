//
//  WetherViewModel.swift
//  WeatherAPPExample
//
//  Created by Soni Suman on 26/12/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import Foundation
import Combine

class WetherViewModel: ObservableObject {
  private  var weatherService: WeatherService!
    
    @Published var weather = Weather()
    
    var tempeture: String {
        if let temp = weather.temp {
            return String(format: "%0.f",temp)
        }
        else {
            return ""
        }
    }
    var humidity: String {
        if let humidity = weather.humidity {
            return String(format: "%0.f",humidity)
        }
        else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            featchWeather(by: city)
        }
       
    }
    
    
    init() {
        self.weatherService = WeatherService()
    }
    
    func  featchWeather(by city: String) {
        weatherService.getWeatherData(city: city) {weatherData in
            
          if let weatherData = weatherData {
            DispatchQueue.main.async {
              self.weather = weatherData
            }
            }
        
    }
    
}
}
