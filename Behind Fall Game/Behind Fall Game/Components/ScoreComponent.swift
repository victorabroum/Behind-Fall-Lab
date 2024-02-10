//
//  ScoreComponent.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 10/02/24.
//

import Foundation
import GameplayKit

class ScoreComponent: GKComponent {
    
    private var score: Int = 0
    
    public func addScore(amount: Int = 1) {
        score += amount
        print("SCORE: \(score)")
    }
}
