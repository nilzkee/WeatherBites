//
//  Home.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 21/05/24.

import SwiftUI
import ClockKit

struct MealCircle: View {
    let systemName: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(.secondary)
            Image(systemName: systemName)
        }
    }
}

struct Home: View {
    let mealSymbols = ["fork.knife.circle.fill", "birthday.cake.fill", "mug.fill", "carrot.fill"]
    
    var body: some View {
        NavigationView {
            VStack {
                
                WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
                
                CobaZoneLagi(viewModel: RectangleViewModel(rectangleData: [
                    RectangleData(darkColor: Color(red: 0.12, green: 0.24, blue: 0.35), lightColor: .blue, width: 18, height: 60, labelText: "Find\nBreakfast", trianglePosition: -40),
                    RectangleData(darkColor: Color(red: 0.36, green: 0.33, blue: 0.1), lightColor: .green, width: 18, height: 60, labelText: "Find\nSnack", trianglePosition: -20),
                    RectangleData(darkColor: Color(red: 0.35, green: 0.2, blue: 0.07), lightColor: .yellow, width: 18, height: 60, labelText: "Find\nLunch", trianglePosition: 0),
                    RectangleData(darkColor: Color(red: 0.36, green: 0.15, blue: 0.1), lightColor: .orange, width: 18, height: 60, labelText: "Find\nSnack", trianglePosition: 20),
                    RectangleData(darkColor: Color(red: 0.31, green: 0.04, blue: 0.28), lightColor: .purple, width: 18, height: 60, labelText: "Find\nDinner", trianglePosition: 40)
                ]))
                
                VStack(alignment: .center, spacing: 2) {
                    HStack {
                        Text("MEAL TYPES")
                            .font(
                                Font.custom("SF Compact Rounded", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.95, green: 0.7, blue: 0.42))
                            .frame(width: 144, height: 12, alignment: .leading)
                            .padding(.top, 5)
                        Spacer()
                    }
                    
                    HStack {
                        ForEach(mealSymbols, id: \.self) { symbol in
                            MealCircle(systemName: symbol)
                        }
                        Spacer()
                    }
                    .padding(.top, 2)
                    
                }
                Spacer()
            }
            .padding(.leading, 11)
            .padding(.trailing, 11)
            .padding(.top, 13)
            .padding(.bottom, 13)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Home()
}
