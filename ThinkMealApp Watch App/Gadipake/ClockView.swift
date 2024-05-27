//
//  ClockView.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 21/05/24.
//

import SwiftUI

struct ClockView: View {
    @State private var currentTime: String = ""

    var body: some View {
        Text(currentTime)
            .font(Font.custom("SF Compact Rounded", size: 14))
            .foregroundColor(.white)
            .onAppear {
                updateTime()
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    updateTime()
                }
            }
    }

    private func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        currentTime = formatter.string(from: Date())
    }
}

#Preview {
    ClockView()
}
