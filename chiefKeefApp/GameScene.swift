//
//  GameScene.swift
//  chiefKeefApp
//
//  Created by Zuzu Lasota  on 4/22/22.


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "gloGuy") as! SKSpriteNode
        
        backgroundColor = SKColor.purple
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 60.0))
        }
    }
    
    
}
