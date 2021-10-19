//
//  dataAnalysisTabView.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/26.
//

import SwiftUI

struct dataAnalysisView: View {
    
    @State var selectedIndex: Int = 0
    @State var selectedAreaIndex: Int = 0
    @State var selectedStackedBarChartIndex: Int = 0
    @State var isSelectedStackedBarChartIndex: Bool = false



    var floors = [floorData(name: "B1",image: "B1", visView: "B1visView", value: 250),
                  floorData(name: "1F",image: "1F", visView: "1fvisView", value: 200),
                  floorData(name: "2F",image: "2F", visView: "21visView", value: 100)]
    
    var floorColor: [Color] = [Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]

    @State var tempData: [[CGFloat]] =
        [[60, 60, 60],
         [60, 40, 65],
         [50, 60, 61],
         [50, 60, 54],
         [50, 40, 66],
         [30, 30, 40],
         [30, 30, 40]]
    
    var body: some View {
        VStack{
            Text("Data Analysis")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .padding(.all)
            //line chart view
//            VStack{
//                lineChartText(logs: usingTimeTestData.testData, selectedIndex: $selectedIndex)
//                lineChartGraph(logs: usingTimeTestData.testData, selectedIndex: $selectedIndex)
//                
//            }
//            .padding(.all)

            VStack{
                stackedAreaChartText(logs: usingTimeTestData.testData, selectedIndex: $selectedIndex)
                stackedAreaChartGraph(logs: usingTimeTestData.testData, selectedIndex: $selectedIndex)
            }
            .padding(.all)
            

            VStack{
                barChartText(logs: tempData, selectedStackedBarChartIndex: $selectedStackedBarChartIndex, isSelectedStackedBarChartIndex: $isSelectedStackedBarChartIndex)
                    .padding(.horizontal)
                HStack(alignment: .bottom, spacing: 50){
                    barChartGraph(selectedStackedBarChartIndex: $selectedStackedBarChartIndex, isSelectedStackedBarChartIndex: $isSelectedStackedBarChartIndex, logs: usingTimeTestData.testData)

                    VStack{
                        legend(legendsColor: floorColor)
                        donutChartView()
        //                    .border(Color.black)
                    }
                }
            }
            
            Color.clear //for padding
                .frame(height:20)

            VStack(spacing:0){
                
                HStack{
                    Text("Navigation for each floor")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.all)
                

                NavigationView{
                    
                    List {
                        ForEach(floors) { floorData in
                            NavigationLink(destination: Text("text")) {

                                HStack{
                                    Image(floorData.image)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .cornerRadius(5)

                                    Text("\(floorData.name)")
                                        .frame(width: 40)
                                    Capsule().frame(width: floorData.value, height: 30)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.6740480132)))
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Hidden Title")
                    .navigationBarHidden(true)

                }
                .navigationViewStyle(StackNavigationViewStyle())
                

            }
            .padding(.horizontal)


            
            
            
        }
        .padding(.all)
    }
}

struct floorData: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var visView: String
    var value: CGFloat
}


struct legend: View {
    
    var legendsColor: [Color]
    
    var body: some View {
        HStack{
            Rectangle().frame(width: 20, height: 20)
                .foregroundColor(legendsColor[0])
            Text("B1")
            
            Rectangle().frame(width: 20, height: 20)
                .foregroundColor(legendsColor[1])
            Text("1F")
            
            Rectangle().frame(width: 20, height: 20)
                .foregroundColor(legendsColor[2])
            Text("2F")
        }
    }
}

