//
//  ShieldEntity.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 10/02/24.
//

import Foundation
import GameplayKit
import SpriteKit

public class ShieldEntity: GKEntity {
    public init(position: CGPoint) {
        
        super.init()
        
        let node = SKSpriteNode(color: .red, size: .init(width: 100, height: 100))
        node.position = position
        self.addComponent(GKSKNodeComponent(node: node))
        
        let body = SKPhysicsBody(rectangleOf: node.size)
        body.affectedByGravity = true
        body.categoryBitMask = .item
        body.collisionBitMask = ~(.contactWithAllCategories(less: [.enemy]))
        body.contactTestBitMask = .player
        self.addComponent(PhysicsComponent(physicsBody: body))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if let node = self.component(ofType: GKSKNodeComponent.self)?.node {
            node.removeFromParent()
        }
    }
}





