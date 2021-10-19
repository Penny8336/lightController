//
//  lineChartGraph.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/24.
//

import SwiftUI

struct lineChartGraph: View {
    
    var logs: [dateInfo]
    
    @State var dataSize: Int = 14
    @State var isSelected: Bool = false
    @State var selectedYPos: CGFloat = 0
    @State var selectedXPos: CGFloat = 8
    @State var lineOffset: CGFloat = 8

    @Binding var selectedIndex: Int

    var body: some View {
        drawGrid()
            .opacity(0.2)
            .overlay(drawLogPoints(dateInfos: logs))
            .overlay(drawActivityLine(dateInfos: logs))
            .overlay(drawActivityGradient(dateInfos: logs))
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
    
    func drawLogPoints(dateInfos: [dateInfo]) -> some View {

        GeometryReader { geo in
            
            let maxNum = dateInfos.reduce(0) { (res, dateInfo) -> Int in
                print(dateInfo.totalTime)
                return max(res, dateInfo.totalTime)
            }
            
            var scale = maxNum == 0 ? 1 : geo.size.height / CGFloat(maxNum)
            
            ForEach(dateInfos.indices) { i in
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, miterLimit: 80, dash: [], dashPhase: 0))
                    
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(Color(red: 251/255, green: 82/255, blue: 0))
                    .background(Color.white)
                    .cornerRadius(5)
                    .offset(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * CGFloat(i) - 5, y: (geo.size.height - (CGFloat(dateInfos[i].totalTime) * scale)) - 5)
            }
        }
    }
    
    func drawActivityLine(dateInfos: [dateInfo]) -> some View {
        GeometryReader { geo in
            Path { p in
                let maxNum = dateInfos.reduce(0) { (res, dateInfo) -> Int in
                    print(dateInfo.totalTime)
                    return max(res, dateInfo.totalTime)
                }

                var scale = maxNum == 0 ? 1 : geo.size.height / CGFloat(maxNum)

                var index: CGFloat = 0

                p.move(to: CGPoint(x: 8, y: geo.size.height - (CGFloat(dateInfos[0].totalTime) * scale)))

                for _ in dateInfos {
                    if index != 0 {
                        p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * index, y: geo.size.height - (CGFloat(dateInfos[Int(index)].totalTime) * scale)))
                    }
                    index += 1
                }
            }
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 80, dash: [], dashPhase: 0))
            .foregroundColor(Color(red: 251/255, green: 82/255, blue: 0))
        }
    }

    func drawActivityGradient(dateInfos: [dateInfo]) -> some View {
        LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 82/255, blue: 0), .white]), startPoint: .top, endPoint: .bottom)
            .padding(.horizontal, 8)
            .padding(.bottom, 1)
            .opacity(0.8)
            .mask(
                GeometryReader { geo in
                    Path { p in
                        // Used for scaling graph data
                        let maxNum = dateInfos.reduce(0) { (res, dateInfo) -> Int in
                            print(dateInfo.totalTime)
                            return max(res, dateInfo.totalTime)
                        }

                        let scale = geo.size.height / CGFloat(maxNum)

                        var index: CGFloat = 0

                        // Move to the starting y-point on graph
                        p.move(to: CGPoint(x: 8, y: geo.size.height - (CGFloat(dateInfos[Int(index)].totalTime) * scale)))

                        // For each week draw line from previous week
                        for _ in dateInfos {
                            if index != 0 {
                                p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * index, y: geo.size.height - (CGFloat(dateInfos[Int(index)].totalTime) * scale)))
                            }
                            index += 1
                        }

                        // Finally close the subpath off by looping around to the beginning point.
                        p.addLine(to: CGPoint(x: 8 + ((geo.size.width - 16) / CGFloat((dateInfos.count) - 1)) * (index - 1), y: geo.size.height))
                        p.addLine(to: CGPoint(x: 8, y: geo.size.height))
                        p.closeSubpath()
                    }
                }
            )
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
                    .frame(width: 2)
                    .overlay(
                        Circle()
                            .frame(width: 24, height: 24, alignment: .center)
                            .foregroundColor(Color(red: 251/255, green: 82/255, blue: 0))
                            .opacity(0.2)
                            .overlay(
                                Circle()
                                    .fill()
                                    .frame(width: 12, height: 12, alignment: .center)
                                    .foregroundColor(Color(red: 251/255, green: 82/255, blue: 0))
                            )
                            .offset(x: 0, y: isSelected ? 12 - (selectedYPos * scale) : 12 - (CGFloat(dateInfos[selectedIndex].totalTime) * scale))
                        , alignment: .bottom)

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
