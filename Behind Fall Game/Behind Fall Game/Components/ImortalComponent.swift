//
//  ImortalComponent.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 10/02/24.
//

import Foundation
import GameplayKit
import SpriteKit

class ImortalComponent: GKComponent { 
    
    var node: SKNode?
    
    override func didAddToEntity() {
        node = self.entity?.component(ofType: GKSKNodeComponent.self)?.node
        
        node?.run(.repeatForever(.sequence([
            .fadeAlpha(to: 0.3, duration: 0.01),
            .fadeAlpha(to: 1, duration: 0.01),
        ])), withKey: "imortal-action")
        
        node?.run(.sequence([
            .wait(forDuration: 5),
            .run { [weak self] in
                self?.entity?.removeComponent(ofType: ImortalComponent.self)
            }
        ]))
    }
    
    override func willRemoveFromEntity() {
        node?.removeAction(forKey: "imortal-action")
        node?.run(.fadeAlpha(to: 1, duration: 0))
    }
    
}
