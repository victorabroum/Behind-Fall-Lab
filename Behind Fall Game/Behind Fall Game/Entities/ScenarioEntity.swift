//
//  ScenarioEntity.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 24/01/24.
//

import Foundation
import GameplayKit
import SpriteKit

class ScenarioEntity: GKEntity {
    init(named: String, entityManager: SKEntityManager){
        super.init()
        if let scenarioNode = SKReferenceNode(fileNamed: named) {
            self.addComponent(GKSKNodeComponent(node: scenarioNode))
            
            if let tileMapNode = scenarioNode.childNode(withName: "*/ground") as? SKTileMapNode {
                tileMapNode.addPhysicsToTileMap(entityManager: entityManager)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
