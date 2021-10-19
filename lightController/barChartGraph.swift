//
//  barChartGraph.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/25.
//

import SwiftUI

struct barChartGraph: View {

    @Binding var selectedStackedBarChartIndex: Int
    @Binding var isSelectedStackedBarChartIndex: Bool
    
    @State var dataSize: Int = 14
    @State var lineOffset: CGFloat = 8

    var floorColor: [Color] = [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]
    var aWeek: [String] = ["MON", "TUE", "WED", "THUR", "FIR", "SAT", "SUN"]
    var logs: [dateInfo]

    @State var tempData: [[CGFloat]] =
        [[60, 60, 70],
         [60, 40, 65],
         [50, 60, 61],
         [50, 60, 54],
         [50, 40, 66],
         [30, 30, 40],
         [30, 30, 40]]

    var body: some View {
        
            
        drawGrid()
            .opacity(0.2)
            .frame(width: 500)
    //            .frame(height: barChartHeight)
//            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .overlay(drawStackedBar(logs: logs, floorColor: floorColor))
            .overlay(drawYAxis())
            .overlay(addUserInteraction(dateInfos: logs))

    }
    
    func drawGrid() -> some View {
        VStack(spacing: 30) {
            
            
            dottedLine() //top line
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                .frame(height: 1, alignment: .center)
                .foregroundColor(Color.clear)
            
            VStack(spacing: 59){
                
                ForEach(0..<4) { i in
                    dottedLine()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                        .frame(height: 1, alignment: .center)
                        .foregroundColor(Color.black)

                }
            }

            dottedLine() //bottom line
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                .frame(height: 1, alignment: .center)
                .foregroundColor(Color.clear)
            
        }
    }
    
    func drawStackedBar(logs: [dateInfo], floorColor: [Color]) -> some View {

        GeometryReader { geo in
            
            let w = geo.size.width
            let block: CGFloat = (w-(60)) / 6
            let barWidth = block / 2.1
            
            ForEach(0 ..< 7) { i in

                ForEach(0 ..< 3) { j in
                    let sumTemp = Sum(ary: logs[i], index: j)
                    Rectangle().frame(width: barWidth, height: CGFloat(logs[i].floors[j].totalTime))
                        .foregroundColor(floorColor[j])
                        .offset(x: 30 + (block * CGFloat(i)), y:  210 -  CGFloat(sumTemp))
                        .gesture(DragGesture(minimumDistance: 0)
                                    .onChanged( { _ in
//                                        isActive = true
                                        isSelectedStackedBarChartIndex = true
                                        selectedStackedBarChartIndex = logs[i].floors[j].totalTime
                                    } )
                                    .onEnded( { _ in
                                        isSelectedStackedBarChartIndex = false
//                                        selectedStackedBarChartIndex = logs[i].floors[j].totalTime
                                    } )
                        )
//                        .gesture(DragGesture(minimumDistance: 0)
//                                    .onChanged( { _ in isActive = true } )
//                                    .onEnded( { _ in isActive = false } )
//                        )
                    Text("\(aWeek[i])")
                        .frame(width: 55, alignment: .center)
//                        .border(Color.black)
                        .offset(x: 20 + (block * CGFloat(i)) , y:  210 + 10)

                }
                let sumToatalUP = Sum(ary: logs[i], index: 2)
                Text("\(logs[i].totalTime)")
                    .frame(width: 50, alignment: .center)
                    .offset(x: 22 + (block * CGFloat(i)) , y:  210 -  sumToatalUP - 20)
            }
        }
    }
    
    func drawYAxis()-> some View {
        GeometryReader { geo in
            ForEach(0 ..< 4) { i in
                Text("\(i)")
                    .offset(x: 0 , y:  210 - (60 * CGFloat(i)) - 10)
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
//                Color(red: 251/255, green: 82/255, blue: 0)
//                    .frame(width: 3)
//                    .offset(x: 20 + (80 * CGFloat(1)) , y:  0)
//                    .animation(Animation.spring().speed(4))

                // Drag Gesture Code
//                Color.white.opacity(0.1)
//                    .gesture(
//                        DragGesture(minimumDistance: 0)
//                            .onChanged { touch in
//                                let xPos = touch.location.x
//                                self.isSelected = true
//                                let index = (xPos - 8) / (((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)))
//
//                                if index > 0 && index < CGFloat((dateInfos.count)-1)  {
//                                    let m = (dateInfos[Int(index) + 1].totalTime - dateInfos[Int(index)].totalTime)
//                                    self.selectedYPos = CGFloat(m) * index.truncatingRemainder(dividingBy: 1) + CGFloat(dateInfos[Int(index)].totalTime)
//                                }
//
//
//                                if index.truncatingRemainder(dividingBy: 1) >= 0.5 && index < CGFloat((dateInfos.count) - 1) {
//                                    self.selectedIndex = Int(index) + 1
//                                } else {
//                                    self.selectedIndex = Int(index)
//                                }
//                                self.selectedXPos = min(max(8, xPos), geo.size.width - 8)
//                                self.lineOffset = min(max(8, xPos), geo.size.width - 8)
//                            }
//                            .onEnded { touch in
//                                let xPos = touch.location.x
//                                self.isSelected = false
//                                let index = (xPos - 8) / (((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)))
//
//                                if index.truncatingRemainder(dividingBy: 1) >= 0.5 && index < CGFloat((dateInfos.count) - 1) {
//                                    self.selectedIndex = Int(index) + 1
//                                } else {
//                                    self.selectedIndex = Int(index)
//                                }
//                            }
//                    )
            }
        }
    }
}


struct dottedLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        print(rect.width, rect.height)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}
