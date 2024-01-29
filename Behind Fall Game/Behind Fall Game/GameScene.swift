//
//  GameScene.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 20/01/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager: SKEntityManager?
    private var lastUpdateTime : TimeInterval = 0
    weak var playerEntity: PlayerEntity?
    
    override func sceneDidLoad() {
        entityManager = SKEntityManager(scene: self)
        
        self.physicsWorld.contactDelegate = self
        
        let playerEntity = PlayerEntity(entityManager: entityManager!)
        entityManager?.add(entity: playerEntity)
        self.playerEntity = playerEntity
        
        let scenraioEntity = ScenarioEntity(named: "Level01.sks", entityManager: entityManager!)
        entityManager?.add(entity: scenraioEntity)
        
        let cameraNode = SKCameraNode()
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        self.camera?.setScale(2.5)
        
        let spawnEnemies = SpawnEnemyEntity(entityManager: entityManager!)
        entityManager?.add(entity: spawnEnemies)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        captureInput(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerEntity?.moveComponent?.change(direction: .none)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        captureInput(touches: touches)
    }
   
    override func update(_ currentTime: TimeInterval) {
        
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        if let entities = entityManager?.entities {
            // Update entities
            for entity in entities {
                entity.update(deltaTime: dt)
            }
        }
        
        self.lastUpdateTime = currentTime
    }
    
    public func captureInput(touches: Set<UITouch>) {
        if let location = touches.first?.location(in: self) {
            if location.x <= 0 {
                // Cliquei mais para esquerdo
                playerEntity?.moveComponent?.change(direction: .left)
            } else {
                // Cliquei mais para direita
                playerEntity?.moveComponent?.change(direction: .right)
            }
        }
    }
}
