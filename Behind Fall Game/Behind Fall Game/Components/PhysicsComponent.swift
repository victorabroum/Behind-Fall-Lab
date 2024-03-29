//
//  PhysicsComponent.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 24/01/24.
//

import Foundation
import GameplayKit
import SpriteKit

class PhysicsComponent: GKComponent {
    
    var body: SKPhysicsBody
    
    init(physicsBody: SKPhysicsBody) {
        self.body = physicsBody
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        if let node = self.entity?.component(ofType: GKSKNodeComponent.self)?.node {
            node.physicsBody = self.body
        }
    }
    
}
