//
//  WeatherView.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 25/05/24.
//


import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))

                    Image(systemName: viewModel.weatherIcon)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.orange)
                }
                .frame(width: 40, height: 40)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "location.fill")
                    .frame(width: 12, height: 12)
                    .foregroundColor(.orange)
                
                Text(viewModel.cityName)
                    .font(
                        Font.custom("SF Compact Rounded", size: 14))
                
                
                Text("·")
                    .foregroundColor(.orange)

                Text(viewModel.temperature)
                    .font(.system(size:14))
                    .foregroundColor(.orange)
                
                Spacer()

            }
            
//            
//            Text(viewModel.weatherDescription)
//                .font(.title)
            
        }.onAppear(perform: viewModel.refresh)
    }
}

#Preview {
    WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
}

