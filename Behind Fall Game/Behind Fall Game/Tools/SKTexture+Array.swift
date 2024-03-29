//
//  SKTexture+Array.swift
//  Behind Fall Game
//
//  Created by Victor Vasconcelos on 20/01/24.
//

import Foundation
import SpriteKit

extension Array where Element == SKTexture {
    init (withFormat format: String, range: ClosedRange<Int>) {
        self = range.map({ (index) in
            let imageNamed = String(
                format: format, "\(index)")
            let texture = SKTexture(imageNamed: imageNamed)
            texture.filteringMode = .nearest
            return texture
        })
    }
}
