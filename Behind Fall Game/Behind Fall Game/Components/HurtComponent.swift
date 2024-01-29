//
//  HurtComponent.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 29/01/24.
//

import Foundation
import GameplayKit
import SpriteKit

class HurtComponent: GKComponent {
    
    var animation: SKAction
    var node: SKNode?
    
    init(animation: SKAction) {
        self.animation = animation
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        node = entity?.component(ofType: GKSKNodeComponent.self)?.node
    }
    
    public func playAnim() {
        node?.run(animation)
    }
    
    
}
