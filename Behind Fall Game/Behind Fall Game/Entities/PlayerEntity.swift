//
//  PlayerEntity.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 20/01/24.
//

import Foundation
import SpriteKit
import GameplayKit

class PlayerEntity: GKEntity {
    
    var moveComponent: MovementComponent? {
        return component(ofType: MovementComponent.self)
    }
    
    override init() {
        super.init()
        let node = SKSpriteNode(imageNamed: "idle1.png")
        node.anchorPoint = .init(x: 0.46, y: 0)
        self.addComponent(GKSKNodeComponent(node: node))
        
        let size: CGSize = .init(width: 28 * 7, height: 48 * 7)
        let body = SKPhysicsBody(rectangleOf: size, center: .init(x: 0, y: size.height/2))
        self.addComponent(PhysicsComponent(physicsBody: body))
        
        let animationComp = AnimationComponent(
            idleAction: .repeatForever(.animate(with: .init(withFormat: "idle%@.png", range: 1...10), timePerFrame: 0.1)),
            runAction: .repeatForever(.animate(with: .init(withFormat: "run%@.png", range: 1...10), timePerFrame: 0.1)))
        self.addComponent(animationComp)
        
        let moveComp = MovementComponent(speed: 15)
        self.addComponent(moveComp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
