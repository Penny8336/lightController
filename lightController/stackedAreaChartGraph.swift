//
//  lineChartGraph.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/24.
//

import SwiftUI

struct stackedAreaChartGraph: View {
    
    var logs: [dateInfo]

    var areaColor: [Color] = [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]
    var lineColor: [Color] = [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))]

    @State var dataSize: Int = 14
    @State var isSelected: Bool = false
    @State var selectedYPos: CGFloat = 0
    @State var selectedXPos: CGFloat = 8
    @State var lineOffset: CGFloat = 8

    @Binding var selectedIndex: Int

    var body: some View {
        drawGrid()
            .opacity(0.2)
            .overlay(drawActivityLine(dateInfos: logs, areaColor: lineColor))
            .overlay(drawActivityGradient(dateInfos: logs, areaColor: areaColor))
            .overlay(addUserInteraction(dateInfos: logs))

    }
    
    func drawGrid() -> some View {
        VStack(spacing: 0) {
            Color.black.frame(height: 1, alignment: .center) //top line
            HStack(spacing: 0) {
                Color.clear //opactiy=0, for padding
                    .frame(width: 8, height: 100)
                
                ForEach(0..<dataSize-1) { i in
                    Color.black.frame(width: 1, height: 100, alignment: .center)
                    Spacer()
                        
                }
                Color.black.frame(width: 1, height: 100, alignment: .center) //line
                Color.clear //opactiy=0, for padding
                    .frame(width: 8, height: 100)
            }
            Color.black.frame(height: 1, alignment: .center) //bottom line
        }
    }
    
    func drawActivityLine(dateInfos: [dateInfo], areaColor: [Color]) -> some View {
        GeometryReader { geo in
            ForEach(0 ..< 3) { i in

                Path { p in
                    
                    let maxNum = dateInfos.reduce(0) { (res, dateInfo) -> Int in
                        print(dateInfo.totalTime)
                        return max(res, dateInfo.totalTime)
                    }
                    var scale = maxNum == 0 ? 1 : geo.size.height / CGFloat(maxNum)

                    var index: CGFloat = 0

                    p.move(to: CGPoint(x: 8, y: geo.size.height - (Sum(ary: dateInfos[Int(index)], index: i) * scale)))

                    for _ in dateInfos {
                        if index != 0 {
                            p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * index,
                                                  y: geo.size.height - (Sum(ary: dateInfos[Int(index)], index: i) * scale)))
                        }
                        index += 1
                    }
                }
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 80, dash: [], dashPhase: 0))
                .foregroundColor(areaColor[i])
            }
        }
    }
    
    func drawActivityGradient(dateInfos: [dateInfo], areaColor: [Color]) -> some View {
        
        GeometryReader { geo in
            ForEach(0 ..< 3) { i in //floor

                Path { p in
                            // Used for scaling graph data
                    let maxNum = dateInfos.reduce(0) { (res, dateInfo) -> Int in
                        print(dateInfo.totalTime)
                        return max(res, dateInfo.totalTime)
                    }

//                    let maxNum = 100
                    let scale = geo.size.height / CGFloat(maxNum)

                    var index: CGFloat = 0
                    
                    var begin:CGFloat = 0
                    if i > 0 {
                        begin = Sum(ary: dateInfos[0], index: i-1) * scale
                    }
                    
                    var end:CGFloat = 0
                    if i > 0 {
                        end = Sum(ary: dateInfos[13], index: i-1) * scale
                    }
                    
                    
                    // Move to the starting y-point on graph
                    p.move(to: CGPoint(x: 8, y: geo.size.height - (Sum(ary: dateInfos[Int(index)], index: i) * scale)))

                    // For each week draw line from previous week
                    for _ in dateInfos {
                        var startY:CGFloat = 0
                        if index > 0 {
                            startY = 30
//                            var startY = CGFloat(dateInfos[Int(index)].floors[Int(index)-1].totalTime) * scale
                        }
                        p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * index,
                                              y: geo.size.height - (Sum(ary: dateInfos[Int(index)], index: i) * scale)))
                        index += 1
                    }

                    // Finally close the subpath off by looping around to the beginning point.
                    if i > 0 {
                        
                        for number in 0...13 {
                            var tempIndex:CGFloat = CGFloat(abs(number - 13))
                            p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * tempIndex,
                                                  y: geo.size.height - (Sum(ary: dateInfos[Int(abs(number - 13))], index: i-1) * scale)))
                            
                        }
                    }
                    else{
                        p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * (index - 1), y: geo.size.height - end))
                        p.addLine(to: CGPoint(x: 8, y: geo.size.height - begin))
                    }

                    p.closeSubpath()
                }
                .foregroundColor(areaColor[i])
                .opacity(0.7)
            }
        }
    }
    
    func Sum(ary: dateInfo, index: Int) -> CGFloat{
        
        var total = 0
        for number in 0...index {
            total += ary.floors[number].totalTime
        }
        
        
        return CGFloat(total)
    }
    
    func addUserInteraction(dateInfos: [dateInfo]) -> some View {
        GeometryReader { geo in

            let maxNum = dateInfos.reduce(0) { (res, dateInfo) -> Int in
                return max(res, dateInfo.totalTime)
            }
            
            var scale = maxNum == 0 ? 1 : geo.size.height / CGFloat(maxNum)

           ZStack(alignment: .leading) {
                // Line and point overlay
                Color(red: 251/255, green: 82/255, blue: 0)
                    .frame(width: 3)
                    .offset(x: isSelected ? lineOffset : 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * CGFloat(selectedIndex), y: 0)
                    .animation(Animation.spring().speed(4))

                // Drag Gesture Code
                Color.white.opacity(0.1)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { touch in
                                let xPos = touch.location.x
                                self.isSelected = true
                                let index = (xPos - 8) / (((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)))

                                if index > 0 && index < CGFloat((dateInfos.count)-1)  {
                                    let m = (dateInfos[Int(index) + 1].totalTime - dateInfos[Int(index)].totalTime)
                                    self.selectedYPos = CGFloat(m) * index.truncatingRemainder(dividingBy: 1) + CGFloat(dateInfos[Int(index)].totalTime)
                                }


                                if index.truncatingRemainder(dividingBy: 1) >= 0.5 && index < CGFloat((dateInfos.count) - 1) {
                                    self.selectedIndex = Int(index) + 1
                                } else {
                                    self.selectedIndex = Int(index)
                                }
                                self.selectedXPos = min(max(8, xPos), geo.size.width - 8)
                                self.lineOffset = min(max(8, xPos), geo.size.width - 8)
                            }
                            .onEnded { touch in
                                let xPos = touch.location.x
                                self.isSelected = false
                                let index = (xPos - 8) / (((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)))

                                if index.truncatingRemainder(dividingBy: 1) >= 0.5 && index < CGFloat((dateInfos.count) - 1) {
                                    self.selectedIndex = Int(index) + 1
                                } else {
                                    self.selectedIndex = Int(index)
                                }
                            }
                    )
            }
        }
    }

}
