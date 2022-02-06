//
//  EarthNode.swift
//  3dEarth
//
//  Created by Mércia Maguerroski on 06/02/22.
//

import SceneKit

class EarthNode: SCNNode {

    override init() {
        super.init()

        createGeometryContents()
        createAction()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func createGeometryContents() {
        self.geometry = SCNSphere(radius: 1)
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Diffuse")
        self.geometry?.firstMaterial?.specular.contents = UIImage(named: "Specular")
        self.geometry?.firstMaterial?.emission.contents = UIImage(named: "Emission")
        self.geometry?.firstMaterial?.normal.contents = UIImage(named: "Normal")

        self.geometry?.firstMaterial?.shininess = 50
    }

    private func createAction() {
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi/180), around: SCNVector3(0, 1, 0), duration: 50)
        let repeatAction = SCNAction.repeatForever(action)
        self.runAction(repeatAction)
    }

}
