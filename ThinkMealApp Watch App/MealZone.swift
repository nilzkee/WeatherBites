//
//  CobaZoneLagi.swift
//  ThinkMealApp Watch App
//
//  Created by Nila Eleora Putri Sianturi on 21/05/24.
//

import SwiftUI

struct RectangleData: Identifiable {
    var id = UUID()
    var darkColor: Color
    var lightColor: Color
    var width: CGFloat
    var height: CGFloat
    var labelText: String?
    var trianglePosition: CGFloat
    var isSelected: Bool = false
}

class RectangleViewModel: ObservableObject {
    @Published var rectangleData: [RectangleData]
    
    init(rectangleData: [RectangleData]) {
        self.rectangleData = rectangleData
        self.updateSelectionBasedOnTime()
    }
    
    func selectRectangle(_ rectangle: RectangleData) {
        for i in 0..<rectangleData.count {
            rectangleData[i].isSelected = (rectangleData[i].id == rectangle.id)
        }
    }
    
    func updateSelectionBasedOnTime() {
        let currentTime = Calendar.current.dateComponents([.hour], from: Date()).hour ?? 0
        for i in 0..<rectangleData.count {
            rectangleData[i].isSelected = false
        }
        
        switch currentTime {
        case 1..<10:
            selectRectangle(rectangleData[0])
        case 10..<12:
            selectRectangle(rectangleData[1])
        case 12..<16:
            selectRectangle(rectangleData[2])
        case 16..<19:
            selectRectangle(rectangleData[3])
        case 19..<24:
            selectRectangle(rectangleData[4])
        default:
            break
        }
    }
}

struct MealZone: View {
    @ObservedObject var viewModel: RectangleViewModel
    @State private var triangleOffset: CGFloat = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            ZStack {
                HStack(alignment: .center, spacing: 2) {
                    ForEach(viewModel.rectangleData) { data in
                        VStack(alignment: .center, spacing: 2) {
                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundColor(.gray)
                            
                            if data.isSelected, let labelText = data.labelText {
                                NavigationLink(destination:   PickMeal(weatherViewModel: WeatherViewModel(weatherService: WeatherService()))) {
                                    Text(labelText)
                                        .font(Font.custom("SF Compact Rounded", size: 17).weight(.bold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 4)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal, 3.73554)
                                .padding(.top, 5)
                                .padding(.bottom, 3)
                                .frame(width: 91, height: 60, alignment: .center)
                                .background(data.lightColor)
                                .cornerRadius(5)
                            } else {
                                Rectangle()
                                    .foregroundColor(data.darkColor)
                                    .frame(width: 18, height: 60)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .frame(width: 12, height: 8)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.45), radius: 1.4, x: 0, y: 0)
                    .offset(x: triangleOffset, y: 33)
            }
            .padding(.top, 5)
            .onAppear {
                updateSelectionAndTriangleOffset()
                timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                    withAnimation(.easeInOut) {
                        updateSelectionAndTriangleOffset()
                    }
                }
            }
            .onDisappear {
                timer?.invalidate()
            }
        }
    }
    
    private func calculateTriangleOffset(selectedData: RectangleData) -> CGFloat {
        return selectedData.trianglePosition
    }
    
    private func updateSelectionAndTriangleOffset() {
        viewModel.updateSelectionBasedOnTime()
        if let selectedData = viewModel.rectangleData.first(where: { $0.isSelected }) {
            triangleOffset = calculateTriangleOffset(selectedData: selectedData)
        }
    }
}

#Preview {
    MealZone(viewModel: RectangleViewModel(rectangleData: [
        RectangleData(darkColor: Color(red: 0.12, green: 0.24, blue: 0.35), lightColor: .blue, width: 18, height: 60, labelText: "Find\nBreakfast", trianglePosition: -40),
        RectangleData(darkColor: Color(red: 0.36, green: 0.33, blue: 0.1), lightColor: .green, width: 18, height: 60, labelText: "Find\nSnack", trianglePosition: -20),
        RectangleData(darkColor: Color(red: 0.35, green: 0.2, blue: 0.07), lightColor: .yellow, width: 18, height: 60, labelText: "Find\nLunch", trianglePosition: 0),
        RectangleData(darkColor: Color(red: 0.36, green: 0.15, blue: 0.1), lightColor: .orange, width: 18, height: 60, labelText: "Find\nSnack", trianglePosition: 20),
        RectangleData(darkColor: Color(red: 0.31, green: 0.04, blue: 0.28), lightColor: .purple, width: 18, height: 60, labelText: "Find\nDinner", trianglePosition: 40)
    ]))
}


