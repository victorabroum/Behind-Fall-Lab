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
    
    public init(entityManager: SKEntityManager) {
        super.init()
        let node = SKSpriteNode(imageNamed: "idle1.png")
        node.anchorPoint = .init(x: 0.46, y: 0)
        self.addComponent(GKSKNodeComponent(node: node))
        
        let size: CGSize = .init(width: 28 * 7, height: 48 * 7)
        let body = SKPhysicsBody(rectangleOf: size, center: .init(x: 0, y: size.height/2))
        body.categoryBitMask = .player
        body.contactTestBitMask = .enemy
        self.addComponent(PhysicsComponent(physicsBody: body))
        
        let animationComp = AnimationComponent(
            idleAction: .repeatForever(.animate(with: .init(withFormat: "idle%@.png", range: 1...10), timePerFrame: 0.1)),
            runAction: .repeatForever(.animate(with: .init(withFormat: "run%@.png", range: 1...10), timePerFrame: 0.1)))
        self.addComponent(animationComp)
        
        let moveComp = MovementComponent(speed: 12)
        self.addComponent(moveComp)
        
        let hurtComp = HurtComponent(animation: .sequence([
            .repeat(.sequence([
                .colorize(with: .white, colorBlendFactor: 1, duration: 0.05),
                .colorize(with: .black, colorBlendFactor: 1, duration: 0.05),
            ]), count: 5),
            .fadeOut(withDuration: 0.05),
            .run { [weak self] in
                guard let self else { return }
                entityManager.remove(entity: self)
            }
        ]))
        
        self.addComponent(hurtComp)
        
        self.addComponent(ScoreComponent())
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
