//
//  stackedBarCharts.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/18.
//

import Foundation
import SwiftUI
import SceneKit
import SwiftUICharts

struct StackedBarChartDemoView: View {
    
    let data = makeData()
    
    var body: some View {
            
        StackedBarChart(chartData: data)
            .touchOverlay(chartData: data)
            .xAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: UIScreen.main.bounds.width / 1.5, maxHeight: UIScreen.main.bounds.height / 3)
            .padding(.all)
    }
}

struct StackedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StackedBarChartDemoView()
    }
}

extension StackedBarChartDemoView {
    static func makeData() -> StackedBarChartData {
        
        enum Group {
            case england
            case scotland
            case wales
            
            var data : GroupingData {
                switch self {
                case .england:
                    return GroupingData(title: "B1" , colour: ColourStyle(colour: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))))
                case .scotland:
                    return GroupingData(title: "1F", colour: ColourStyle(colour: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))))
                case .wales:
                    return GroupingData(title: "2F"   , colour: ColourStyle(colour: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))))
                }
            }
        }
        
        let groups : [GroupingData] = [Group.england.data, Group.scotland.data, Group.wales.data]

        let data = StackedBarDataSets(dataSets: [
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 100, description: "Q1 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 500, description: "Q1 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q1 Sales", group: Group.wales.data),
            ], setTitle: "MON"),
            
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 200, description: "Q2 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 600, description: "Q2 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 400, description: "Q2 Sales", group: Group.wales.data),
            ], setTitle: "TUE"),
            
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 700, description: "Q3 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.wales.data),
            ], setTitle: "WED"),
            
            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 300, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "THUR"),
            
            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 100, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 800, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "FIR"),
            
            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 500, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "SAT"),
            
            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 300, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 100, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 300, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "SUN")
        ])

        
        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Time", subtitle: "subtitle"),
                                   xAxisLabels: ["One", "Two", "Three"],
                                   barStyle: BarStyle(barWidth: 0.3),
                                   chartStyle: BarChartStyle(infoBoxPlacement: .header,
                                                             xAxisGridStyle: GridStyle(numberOfLines: 8,
                                                                                       lineColour: Color.red),
                                                             xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                                             yAxisGridStyle: GridStyle(numberOfLines: 7,
                                                                                       lineColour: Color.red),
                                                             yAxisNumberOfLabels: 5,
                                                             baseline: .zero,
                                                             topLine: .maximum(of: 1600)))
    }
}
