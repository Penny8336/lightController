//
//  lineChartText.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/26.
//

import SwiftUI

struct stackedAreaChartText: View {
    
    var logs: [dateInfo]
    var areaColor: [Color] = [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]

    @Binding var selectedIndex: Int

    var body: some View {
        HStack(spacing:20){
            Text("Stacked Area Chart")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Time")
                    .font(.caption)
                    .foregroundColor(Color.black.opacity(0.5))
                Text("\(bigDateformatter(logs[selectedIndex].date))")
                    .font(Font.system(size: 20, weight: .medium, design: .default))
            }
            .frame(width: 120)
            
            ForEach(0 ..< 3) { i in
                VStack(alignment: .leading, spacing: 4) {
                    Text("Using Time")
                        .font(.caption)
                        .foregroundColor(Color.black.opacity(0.5))
                    Text("\(logs[selectedIndex].floors[i].totalTime)")
                        .font(Font.system(size: 20, weight: .bold, design: .default ))
                        .foregroundColor(areaColor[i])
                }
            }
            

//
//            VStack(alignment: .leading, spacing: 4) {
//                Text("Time")
//                    .font(.caption)
//                    .foregroundColor(Color.black.opacity(0.5))
//                Text(String(format: "%.0fh", logs[selectedIndex].duration / 3600) + String(format: " %.0fm", logs[selectedIndex].duration.truncatingRemainder(dividingBy: 3600) / 60))
//                    .font(Font.system(size: 20, weight: .medium, design: .default))
//            }
//
//            VStack(alignment: .leading, spacing: 4) {
//                Text("Elevation")
//                    .font(.caption)
//                    .foregroundColor(Color.black.opacity(0.5))
//                Text(String(format: "%.0f ft", logs[selectedIndex].elevation))
//                    .font(Font.system(size: 20, weight: .medium, design: .default))
//            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func bigDateformatter(_ timeStamp: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd EE"
        let timeStamp = dateFormatter.string(from: timeStamp)
        return timeStamp
    }
}
