//
//  Meal.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 27/05/24.
//

import Foundation

struct Meal : Identifiable {
    
    let id: Int
    let name: String
    let imageName: String
    let mealType: [String]
    let weatherTags: [String]
    
}

struct MockData {
    
    let sampleMeals =
    Meal(
        id: 1,
        name: "Nasi Goreng",
        imageName: "Nasgor",
        mealType: ["Rice"],
        weatherTags: ["Clear", "Rain", "Clouds"]
    )
    
    
    static let sampleMeals: [Meal] = [
        Meal(
            id: 1,
            name: "Nasi Goreng",
            imageName: "NasiGoreng",
            mealType: ["Rice"],
            weatherTags: ["Clear", "Clouds"]
        ),
        
        Meal(
            id: 2,
            name: "Nasi Bakar",
            imageName: "NasiBakar",
            mealType: ["Rice"],
            weatherTags: ["Clear", "Clouds"]
        ),
        
        Meal(
            id: 3,
            name: "Martabak",
            imageName: "Martabak",
            mealType: ["Sweets", "Snack"],
            weatherTags: ["Clear", "Clouds"]
        ),
        
        Meal(
            id: 4,
            name: "Kue Lapis",
            imageName: "KueLapis",
            mealType: ["Sweets", "Snack"],
            weatherTags: ["Clear", "Rain", "Clouds"]
        ),
        
        Meal(
            id: 5,
            name: "Soto Mie",
            imageName: "Sotomie",
            mealType: ["Soup"],
            weatherTags: ["Rain", "Clouds", "Thunderstorm", "Drizzle"]
        ),
        
        Meal(
            id: 6,
            name: "Indomie",
            imageName: "Indomie",
            mealType: ["Soup"],
            weatherTags: ["Rain", "Clouds", "Thunderstorm", "Drizzle"]
        ),
        
        Meal(
            id: 7,
            name: "Es Kopi Susu",
            imageName: "EsKopiSusu",
            mealType: ["Cold Drinks"],
            weatherTags: ["Clear"]
        ),
        
        Meal(
            id: 8,
            name: "Nasi Padang",
            imageName: "Nasi Padang",
            mealType: ["Rice"],
            weatherTags: ["Clear", "Rain", "Clouds"]
        ),
        
        Meal(
            id: 9,
            name: "Es Teh Manis",
            imageName: "EsTehManis",
            mealType: ["Cold Drink"],
            weatherTags: ["Clear"]
        ),
        
        Meal(
            id: 10,
            name: "Bubur",
            imageName: "Bubur",
            mealType: ["Rice"],
            weatherTags: ["Clear", "Rain", "Clouds"]
        ),
        
        Meal(
            id: 11,
            name: "Salad",
            imageName: "salad",
            mealType: ["Vegetables"],
            weatherTags: ["Clear", "Clouds"]
        )
        
    ]
    
}
