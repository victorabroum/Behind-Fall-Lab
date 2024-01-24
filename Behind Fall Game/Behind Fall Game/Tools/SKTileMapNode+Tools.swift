
import Foundation
import SpriteKit

extension SKTileMapNode {
    
    //call this by passing in your SKTileMapNode, then you should delete the original SKTileMapNode
    func addPhysicsToTileMap()
    {
        
        let tileMap = self
        let startingLocation:CGPoint = tileMap.position
        
        let tileSize = tileMap.tileSize
        
        let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height
        
        for col in 0..<tileMap.numberOfColumns {
            
            for row in 0..<tileMap.numberOfRows {
                
                if let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row) {
                    
                    tileDefinition.textures[0].filteringMode = .nearest
                    
                    if(tileDefinition.userData?["noPhysics"] != nil) { continue }
                    
                    let tileArray = tileDefinition.textures
                    let tileTexture = tileArray[0]
                    let tilePosition = self.centerOfTile(atColumn: col, row: row)
                    
                    
                    var tileNode = SKSpriteNode(color: .red, size: tileSize)
                    
                    // TODO: Spawn Correct Node

                    tileNode.position = tilePosition
                    
                }
            }
        }
    }
}
