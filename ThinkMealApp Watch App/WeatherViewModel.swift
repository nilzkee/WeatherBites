//
//  WeatherViewModel.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 26/05/24.
//

import Foundation
import CoreLocation

private let defaultIcon = "questionmark"
private let iconMap = [
    "Drizzle" : "cloud.drizzle.fill",
    "Thunderstorm" : "cloud.bolt.rain.fill",
    "Rain" : "cloud.rain.fill",
    "Snow" : "cloud.snow.fill",
    "Clear" : "sun.max.fill",
    "Clouds" : "cloud.fill"
]

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    @Published var weatherTag: String = "Clear"

    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                
                print("Received iconName:", weather.iconName)

                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
                self.weatherTag = weather.iconName 
                
            }
        }
    }
}

