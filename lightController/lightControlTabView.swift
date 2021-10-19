//
//  lightControlTabView.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/26.
//

import SwiftUI
import SceneKit

//Controller
struct controllerView: View {
    var body: some View {
        VStack {
            //Header
            Text("Lighting Controller")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40)

            gymOverview()
            lightControl()
            Spacer()
        }
        .padding(.all)
    }
}


struct gymOverview: View {
    
    var appearScene = SCNScene(named: "appearance.scn")

    var body: some View {
        HStack {
            VStack{
                tapSceneView(scene: appearScene!, options: [])
//                SceneView(scene: appearScene,options: [.autoenablesDefaultLighting, .allowsCameraControl])

                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: UIScreen.main.bounds.height / 3)
                    .cornerRadius(20)
                    .onTapGesture {

                        print("tap")
                    }
            }

            
            VStack{
                //                    Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Text("Power Consumption Overview")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.all)

                barChartOverview()
                
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3, alignment: .top)
            .background(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 0.8550548427)))
            .cornerRadius(20)

        }
    }
}

struct lightControl: View {
    
    var F1Scene = SCNScene(named: "1Ftemp.scn")

    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("MONDAY, AUG 20")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Each Floor")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Group {
                        
                        SceneCardView(sceneView: F1Scene!, category: "SwiftUI", heading: "B1 Light Controller", author: "dd")
                        
                        CardView(image: "B1model", category: "SwiftUI", heading: "1F Light Controller", author: "Simon Ng")


                    }
                    .frame(width: 400)
                }
                
                Spacer()
            }
        }
    }
}

struct horizontalBar: View {
    
    var value: CGFloat
    var floor: String
    @State private var sizeChange = false

    var body: some View {
        
        let temp = Int(value / 3)

        VStack{
            HStack{
                Text("\(floor)")
                
                ZStack(alignment: .leading) {
                    Capsule().frame(width: 300, height: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.6740480132)))
                        .scaleEffect(sizeChange ? 1.1 : 1.0)
                    
                    ZStack(alignment: .trailing){
                        Capsule().frame(width: value, height: 30)
                            .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                            .scaleEffect(sizeChange ? 1.1 : 1.0)
                    
                        Text("\(temp) %")
                            .padding(.trailing, 10)
                    }
                }
                .onTapGesture {
                    self.sizeChange.toggle()
                    print("Any")
                }
            }
        }
    }
}


struct barChartOverview: View {

    @State var pickerSelectedItem = 0
    @State var data: [[CGFloat]] = [
        [100, 150, 80, 130, 250],
        [170, 150, 80, 130, 100]
    ]
    
    @State var GymFloor: [String] = ["B1", "1F", "2F", "3F", "4F"]

    var body: some View {
        VStack{
            
            Picker(selection: $pickerSelectedItem, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                Text("Today").tag(0)
                Text("Last 7 Days").tag(1)
            }).pickerStyle(SegmentedPickerStyle())
            
            VStack(spacing: 16){
                horizontalBar(value: data[pickerSelectedItem][0],floor: GymFloor[0])
                horizontalBar(value: data[pickerSelectedItem][1],floor: GymFloor[1])
                horizontalBar(value: data[pickerSelectedItem][2],floor: GymFloor[2])
                horizontalBar(value: data[pickerSelectedItem][3],floor: GymFloor[3])
                horizontalBar(value: data[pickerSelectedItem][4],floor: GymFloor[4])
            }.padding(.top, 24)
            .animation(.default)
        }
        .padding(.horizontal)
    }
}

