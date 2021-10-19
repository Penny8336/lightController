//
//  donutChartGraph.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/26.
//

import SwiftUI


struct donutChartView: View {
    
    var floorColor: [Color] = [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]

    var body: some View {
        VStack{
            ZStack {
                donutSector(sectorColor: floorColor[0], degreeStart: 0, degreeEed: 0.4)
                donutSector(sectorColor: floorColor[1], degreeStart: 0.4, degreeEed: 0.75)
                donutSector(sectorColor: floorColor[2], degreeStart: 0.75, degreeEed: 1)

            }
            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.width / 8)
            .padding(40)
            .cornerRadius(20)
        }
    }
}

struct donutSector: View {
    
    @State private var isActive = false
    var sectorColor: Color
    var degreeStart: CGFloat
    var degreeEed: CGFloat
        
    var body: some View {
        
        Text(isActive ? "\(Int(100 * ( degreeEed - degreeStart )))%" : "")

        Circle()
            .trim(from: degreeStart, to: degreeEed)
            .stroke(sectorColor, lineWidth: 40)
            .animation(.easeOut(duration: 0.2) )
            .gesture(DragGesture(minimumDistance: 0)
                        .onChanged( { _ in isActive = true } )
                        .onEnded( { _ in isActive = false } )
            )
    }
}
