//
//  tapGestureRecognizer.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/9/9.
//

import SwiftUI
import SceneKit

struct tapSceneView: UIViewRepresentable {
    
    var scene: SCNScene
    var options: [Any]
    
    var view = SCNView()
    
    func makeUIView(context: Context) -> SCNView {
        
        // Instantiate the SCNView and setup the scene
        view.scene = scene
        view.pointOfView = scene.rootNode.childNode(withName: "camera", recursively: true)
        view.allowsCameraControl = true
        let root = scene.rootNode
        let parentsNode = root.childNode(withName: "lights", recursively: false)
//        parentsNode?.rotation(SCNVector4(100, 100, 100, 5))
        
        for lights in power.testData {
            let temp = parentsNode?.childNode(withName: lights.ID, recursively: false)
            let tempSpotLight = parentsNode?.childNode(withName: lights.ID + "SpotLight", recursively: false)

            if lights.power{
                temp?.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                tempSpotLight?.isHidden = false

            }
            else{
                temp?.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
                tempSpotLight?.isHidden = true

            }
        }
        
        // Add gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
    
    func updateUIView(_ view: SCNView, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(view)
    }
    
    class Coordinator: NSObject {
        private let view: SCNView
        init(_ view: SCNView) {
            self.view = view
            super.init()
        }
        
        @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
            // check what nodes are tapped
            let location = gestureRecognize.location(in: view)
            let hitResults = view.hitTest(location, options: [:])
            let root = view.scene?.rootNode
            let parentsNode = root?.childNode(withName: "lights", recursively: false)

            print(power.testData)
            // check that we clicked on at least one object
            if hitResults.count > 0 {
                
                // retrieved the first clicked object
                let hitNode = hitResults[0].node
                let hitNodeName: String = hitNode.name!
                let spotLight = parentsNode?.childNode(withName: hitNodeName + "SpotLight", recursively: false)
                let index:Int = power.testData.firstIndex {$0.ID.hasPrefix("\(hitNodeName)")}!
                
                if power.testData[index].power{
                    //control light
//                    hitNodeLight.isHidden = true
                    //control box's color
                    spotLight?.isHidden = true
                    hitNode.geometry!.firstMaterial?.diffuse.contents = UIColor.gray
                    power.testData[index].power = false
                    print("power off", power.testData[0].ID)
                }
                else{
                    //control light
//                    hitNodeLight.isHidden = flase
                    //control box's color
                    spotLight?.isHidden = false
                    hitNode.geometry!.firstMaterial?.diffuse.contents = UIColor.red
                    power.testData[index].power = true

                    print("power on",power.testData[index].ID)
                }
                // get material for selected geometry element
//                let material = result.node.geometry!.materials[(result.geometryIndex)]
                
//                // highlight it
//                SCNTransaction.begin()
//                SCNTransaction.animationDuration = 0.5
//
//                // on completion - unhighlight
//                SCNTransaction.completionBlock = {
//                    SCNTransaction.begin()
//                    SCNTransaction.animationDuration = 0.5
//
//                    material.emission.contents = UIColor.black
//
//                    SCNTransaction.commit()
//                }
//                material.emission.contents = UIColor.green
//                SCNTransaction.commit()
            }
        }
    }
}
