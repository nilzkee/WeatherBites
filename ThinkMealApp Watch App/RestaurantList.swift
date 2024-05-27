//
//  RestaurantList.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 22/05/24.
//

import SwiftUI

struct RestaurantList: View {
    var body: some View {
        List {
            ForEach(0..<10) { index in
                NavigationLink(destination: RestaurantList()) {
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 0.36, green: 0.15, blue: 0.1))
                            .frame(height: 83)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                
                        
                        VStack (alignment: .leading){
                            Text("Restaurant \(index + 1)")
                                .foregroundColor(.white)
                            
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("12 km")
                                        .font(Font.custom("SF Compact", size: 17))
                                        .foregroundColor(Color(red: 1, green: 0.58, blue: 0))
                                        .frame(width: 69, height: 20, alignment: .topLeading)
                                    
                                    Text("$$$$$")
                                        .font(Font.custom("SF Compact", size: 17))
                                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.7))
                                        .frame(width: 48, height: 20, alignment: .topLeading)
                                }
                                Spacer()
                                
                                Image(systemName: "location.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 19, height: 20, alignment: .topLeading)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}


#Preview {
    RestaurantList()
}
