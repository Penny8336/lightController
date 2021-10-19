//
//  ContentView.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/8/17.
//

import SwiftUI
import SceneKit
import Foundation

struct ContentView: View {
    
    var body: some View {
        

        TabView{
            controllerView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Controller")
                }
            dataAnalysisView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Analysis")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

