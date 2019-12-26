//
//  WeatherService.swift
//  WeatherAPPExample
//
//  Created by Soni Suman on 26/12/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import Foundation

let apiKey = "&appid=b6907d289e10d714a6e88b30761fae22"
let apiUrl = "http://api.openweathermap.org/data/2.5/weather?q="

class WeatherService {
    
    func getWeatherData(city: String, completionHendler: @escaping (Weather?)-> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=08047c9ec8d8c5c5c9ac2e0b6e79b8d9") else {
            completionHendler(nil)
            return
        }
        URLSession.shared.dataTask(with: url) {data,response,error in
            guard let data = data, error == nil else {
                completionHendler(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponce.self, from: data)
            if let weatherResponse = weatherResponse {
                let main = weatherResponse.main
                completionHendler(main)
            }
            else {
                completionHendler(nil)
                return
            }
        }.resume()
        
    }
}
