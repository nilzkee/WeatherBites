//
//  Complication Placeholder.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 21/05/24.
//

import SwiftUI

struct Complication_Placeholder: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.3))
            Image(systemName: "cloud.sun.fill")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
    }
}

#Preview {
    Complication_Placeholder()
}
