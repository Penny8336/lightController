//
//  lineChartText.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/26.
//

import SwiftUI

struct lineChartText: View {
    
    var logs: [dateInfo]
    
    @Binding var selectedIndex: Int

    var body: some View {
        HStack(spacing:20){
            Text("Line Chart")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Time")
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                Text("\(bigDateformatter(logs[selectedIndex].date))")
                    .font(Font.system(size: 20, weight: .medium, design: .default))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Using Time")
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                Text(String(logs[selectedIndex].totalTime))
                    .font(Font.system(size: 20, weight: .medium, design: .default))
            }
            
            Spacer()
        }
        .padding(.horizontal)

    }
    
    func bigDateformatter(_ timeStamp: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd EEEE"
        let timeStamp = dateFormatter.string(from: timeStamp)
        return timeStamp
    }
}
