//
//  ViewModel.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 27/05/24.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    var weatherConditions: [String] = []
    
    init() {
        self.filterMeals()
    }
    
    func filterMeals() {
        self.meals = MockData.sampleMeals.filter { meal in
            return meal.weatherTags.contains(where: { tag in
                return self.weatherConditions.contains(tag)
            })
        }
    }
}
