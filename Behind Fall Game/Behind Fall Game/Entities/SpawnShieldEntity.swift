//
//  SpawnShieldEntity.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 10/02/24.
//

import Foundation
import GameplayKit
import SpriteKit
class SpawnShieldEntity: GKEntity {
    
    public init(entityManager: SKEntityManager) {
        super.init()
        
        let node = SKNode()
        self.addComponent(GKSKNodeComponent(node: node))
        
        node.run(.repeatForever(.sequence([
            .wait(forDuration: GameConstants.delayToTrySpwanShield),
            .run {
                // Spawn Shield
                
                let canSpawn = CGFloat.random(in: 0.0...1.0) >= GameConstants.ratioSpwanShield
                
                if (canSpawn) {
                    let shield = ShieldEntity(position: .init(
                        x: .random(in: -GameConstants.horizontalRange...GameConstants.horizontalRange),
                        y: GameConstants.upperPosition))
                    entityManager.add(entity: shield)
                }
            },
        ])))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
