//
//  RecommendationView.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 27/05/24.
//

import SwiftUI

struct RecommendationView: View {
    @ObservedObject var viewModel = MealViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: RestaurantList(/* meal: meal */)) {
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
                .listRowInsets(EdgeInsets())
                .navigationTitle("Meal For You")
            }
            .listStyle(.carousel)
        }  detail: {
  
        }
    }
}

#Preview {
    RecommendationView()
}
