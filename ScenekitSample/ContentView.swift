//
//  ContentView.swift
//  ScenekitSample
//
//  Created by 松本真太朗 on 2021/12/03.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    @State private var showMajanTileView: Bool = false
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                
                Ball()
                    .position(x: width/2, y: height/2)
                Button(action: {
                    showMajanTileView = true
                }) {
                    Text("麻雀")
                }
                .position(x: width*0.1, y: height*0.1)
                NavigationLink(
                    destination: MajanTileView(),
                    isActive: self.$showMajanTileView
                ) { EmptyView() }
            }
        }
    }
}

struct Ball: UIViewRepresentable {
    var scene = SCNScene()
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = scene
        scnView.backgroundColor = UIColor.blue // シーンの初期化
        
        let testGeo = SCNSphere(radius: 1)
        let testNode = SCNNode(geometry: testGeo)
        testGeo.firstMaterial?.diffuse.contents = UIColor.yellow
        scene.rootNode.addChildNode(testNode) // オブジェクトの設置
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        scene.rootNode.addChildNode(cameraNode) // カメラの設置
        
        let omniLight = SCNNode()
        omniLight.light = SCNLight()
        omniLight.light?.type = .omni
        omniLight.position = SCNVector3(10, 10, 10)
        scene.rootNode.addChildNode(omniLight) // 光源の設置
        
        let floorGeo = SCNFloor()
        let floorNode = SCNNode(geometry: floorGeo)
        floorGeo.firstMaterial?.diffuse.contents = UIColor.green
        floorNode.position.y = -1
        scene.rootNode.addChildNode(floorNode) // 床の設置
        
        let test2Geo = SCNCapsule(capRadius: 0.3, height: 2)
        let test2Node = SCNNode(geometry: test2Geo)
        test2Geo.firstMaterial?.diffuse.contents = UIColor.red
        test2Node.position = SCNVector3(0, 2, 0)
        scene.rootNode.addChildNode(test2Node) // オブジェクトの設置2
        
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
    
    typealias UIViewType = SCNView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
