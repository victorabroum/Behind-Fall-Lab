//
//  SKPhysicsMask.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 29/01/24.
//

import Foundation

public extension UInt32 {
    static let base: UInt32 = 0b1
    static let player = UInt32.base << 0
    static let enemy = UInt32.base << 1
    static let ground = UInt32.base << 2
    
    static var allMasks: [UInt32] = [
        .player,
        .enemy,
        .ground
    ]
    
    static func contactWithAllCategories(less: [UInt32] = []) -> UInt32 {
        var result: UInt32 = 0b00
        
        for category in UInt32.allMasks {
            if !less.contains(category) {
                result |= category
            }
        }
        
        return result
    }
}
