//
//  ContentView.swift
//  WeatherAPPExample
//
//  Created by Soni Suman on 26/12/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var weatherModel: WetherViewModel
    
    init() {
        self.weatherModel = WetherViewModel()
    }
    
    var body: some View {
        VStack() {
            TextField("Enter the City Name", text: self.$weatherModel.cityName)
            {
                self.weatherModel.search()
            }.font(.custom("Arial", size: 30))
                 .padding()
                .fixedSize()
            Text(self.weatherModel.tempeture)
                .font(.custom("Arial", size: 50))
                .offset(y: 50)
                .foregroundColor(Color.white)
                .offset(y: 50)
                .padding()
            Text(self.weatherModel.humidity)
            .font(.custom("Arial", size: 50))
            .offset(y: 50)
                .foregroundColor(Color.white)
            .offset(y: 50)
            .padding()
            
        }.frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
