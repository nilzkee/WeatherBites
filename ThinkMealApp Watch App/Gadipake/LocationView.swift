//
//  LocationView.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 24/05/24.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: "location.fill")
                .frame(width: 12, height: 12)
                .foregroundColor(.orange)
            
            VStack {
                if let placemark = locationManager.placemark {
                    Text("\(placemark.name ?? "Unknown")")
                } else {
                    Text("Fetching address...")
                }
            }
            .font(
                Font.custom("SF Compact Rounded", size: 14)
                    .weight(.medium)
            )
            .foregroundColor(.white)
            .onAppear {
                locationManager.startUpdatingLocation()
            }
            .onDisappear {
                locationManager.stopUpdatingLocation()
            }
        }
    }
}

#Preview {
    LocationView()
}



