//
//  MajanTileView.swift
//  ScenekitSample
//
//  Created by 松本真太朗 on 2021/12/04.
//

import SwiftUI
import SceneKit

struct MajanTileView: UIViewRepresentable {
    var scene = SCNScene()
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = scene
        scnView.backgroundColor = UIColor.blue // シーンの初期化
        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = true
        
        let tileGeo = SCNBox(width: 140, height: 80, length: 200, chamferRadius: 10)
        let tileNode = SCNNode(geometry: tileGeo)
        let topMaterial = SCNMaterial()
        let backMaterial = SCNMaterial()
        let side1Material = SCNMaterial()
        let side2Material = SCNMaterial()
        let side3Material = SCNMaterial()
        let side4Material = SCNMaterial()
//        topMaterial.diffuse.contents = Image("2sou")
        topMaterial.diffuse.contents = UIColor.white
        backMaterial.diffuse.contents = UIImage(named: "back")
        backMaterial.diffuse.contentsTransform = SCNMatrix4Translate(
            SCNMatrix4MakeScale(0.7, 0.8, 0.76), 0.15, 0.1, 0.0)
        side1Material.diffuse.contents = UIColor.white
        side2Material.diffuse.contents = UIColor.white
        side3Material.diffuse.contents = UIColor.white
        side4Material.diffuse.contents = UIImage(named: "2sou")
        side4Material.diffuse.contentsTransform = SCNMatrix4Translate(
            SCNMatrix4MakeScale(0.7, 0.8, 0.76), 0.15, 0.1, 0.0)
//        side4Material.diffuse.contents = SK
            
        tileGeo.materials = [topMaterial,side1Material,side2Material,side3Material,side4Material,backMaterial]
        tileNode.position = SCNVector3(0, 100, 0)
        scene.rootNode.addChildNode(tileNode)
        
        let cameraGeo = SCNCamera()
        let cameraNode = SCNNode()
        cameraGeo.zFar = 1000
        cameraNode.camera = cameraGeo
        cameraNode.position = SCNVector3(0, 400, 400)
        cameraNode.eulerAngles = SCNVector3(-Double.pi/4, 0, 0)
        scene.rootNode.addChildNode(cameraNode) // カメラの設置
        
        let omniLight = SCNNode()
        omniLight.light = SCNLight()
        omniLight.light?.type = .omni
        omniLight.position = SCNVector3(500, 500, 500)
        scene.rootNode.addChildNode(omniLight) // 光源の設置
        
        let omniLight2 = SCNNode()
        omniLight2.light = SCNLight()
        omniLight2.light?.type = .omni
        omniLight2.position = SCNVector3(-500, -500, -500)
        scene.rootNode.addChildNode(omniLight2) // 光源の設置
        
        let floorGeo = SCNFloor()
        let floorNode = SCNNode(geometry: floorGeo)
        floorGeo.firstMaterial?.diffuse.contents = UIColor.green
        floorNode.position.y = -1
        scene.rootNode.addChildNode(floorNode) // 床の設置
        
        return scnView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    typealias UIViewType = SCNView
}

struct MajanTileView_Previews: PreviewProvider {
    static var previews: some View {
        MajanTileView()
    }
}
