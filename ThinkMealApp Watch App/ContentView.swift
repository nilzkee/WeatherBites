//
//  ContentView.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 21/05/24.
//

import SwiftUI
import Foundation
import ClockKit


struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        Home()
        
//        RecommendationView()
//        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}

#Preview {
    ContentView()
}
