//
//  barChartText.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/26.
//

import SwiftUI


struct barChartText: View {
    var logs: [[CGFloat]]

    @Binding var selectedStackedBarChartIndex: Int
    @Binding var isSelectedStackedBarChartIndex: Bool

    var body: some View {
        HStack(spacing:20){
            Text("Bar Chart")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 4) {
//                Text(isActive ? "Elevation" : " ")
//                    .font(.caption)
//                    .foregroundColor(Color.black.opacity(0.5))
////                Text(String(format: "%.0f ft", logs[selectedIndex].elevation))
                Text(isSelectedStackedBarChartIndex ? "\(selectedStackedBarChartIndex) " : "tap to show the value")
                    .font(Font.system(size: 20, weight: .medium, design: .default))
            }
            
            Spacer()
        }
        .padding(.horizontal)

    }
}
