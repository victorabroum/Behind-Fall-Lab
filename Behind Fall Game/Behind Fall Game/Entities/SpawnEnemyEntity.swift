//
//  SpawnEnemyEntity.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 29/01/24.
//

import Foundation
import GameplayKit
import SpriteKit

class SpawnEnemyEntity: GKEntity {
    
    public init(entityManager: SKEntityManager) {
        super.init()
        
        let node = SKNode()
        self.addComponent(GKSKNodeComponent(node: node))
        
        node.run(.repeatForever(.sequence([
            .wait(forDuration: GameConstants.delayToSpawnEnemy),
            .run {
                // Spawn Enemy
                let newEnemy = EnemyEntity(position: .init(
                    x: .random(in: -GameConstants.horizontalRange...GameConstants.horizontalRange),
                    y: GameConstants.upperPosition), entityManager: entityManager)
                entityManager.add(entity: newEnemy)
            },
        ])))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
