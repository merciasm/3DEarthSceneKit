//
//  ViewController.swift
//  3dEarth
//
//  Created by Mércia Maguerroski on 06/02/22.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = createSceneWithChildNodes()
        createSceneView(withScene: scene)

    }

    override var prefersStatusBarHidden: Bool {
        return true
    }


    private func createCameraNode() -> SCNNode {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        return cameraNode
    }

    private func createStarsSystem() -> SCNParticleSystem {
        return SCNParticleSystem(named: "StarsParticles.scnp", inDirectory: nil)!
    }

    private func createLightNode() -> SCNNode {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .directional
        lightNode.position = SCNVector3(0, 0, 5)
        return lightNode
    }

    private func createSceneView(withScene scene: SCNScene){
        let sceneView = self.view as! SCNView
        sceneView.scene = scene

        sceneView.showsStatistics = true
        sceneView.backgroundColor = .black
        sceneView.allowsCameraControl = true
    }

    private func createSceneWithChildNodes() -> SCNScene {
        let scene = SCNScene()

        let cameraNode = createCameraNode()
        scene.rootNode.addChildNode(cameraNode)

        let stars = createStarsSystem()
        scene.rootNode.addParticleSystem(stars)

        let lightNode = createLightNode()

        scene.rootNode.addChildNode(lightNode)

        let earthNode = EarthNode()

        scene.rootNode.addChildNode(earthNode)

        return scene
    }

}

