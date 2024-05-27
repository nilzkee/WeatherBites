//
//  PickMeal.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 21/05/24.
//


import SwiftUI

struct PickMeal: View {
    @ObservedObject var weatherViewModel: WeatherViewModel // Observe weather view model
    
    var body: some View {
        NavigationSplitView {
            List(filteredMeals) { meal in
                NavigationLink(destination: RestaurantList()) {
                    ZStack(alignment: .bottom) {
                        
                        Image(meal.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 145)
                            .cornerRadius(10)
                            .clipped()
                        
                        Text(meal.name)
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding()
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 5))
                    }
                    .frame(width: 180, height: 145)
                }
                .listRowInsets(EdgeInsets()) // Remove row insets
                .navigationTitle("Meal For You")
            }
            .listStyle(.carousel)
        } detail: {
            ContentUnavailableView("Select a Meal", systemImage: "fork.knife", description: Text("Pick something from the list."))
        }
        .onAppear {
            weatherViewModel.refresh()
        }
    }
    
    // Filtered meals based on current weather tag
    var filteredMeals: [Meal] {
        MockData.sampleMeals.filter { meal in
            meal.weatherTags.contains(weatherViewModel.weatherTag)
        }
    }
}

#Preview {
    PickMeal(weatherViewModel: WeatherViewModel(weatherService: WeatherService()))
}


