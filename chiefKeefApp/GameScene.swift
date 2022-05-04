//
//  GameScene.swift
//  chiefKeefApp
//
//  Created by Zuzu Lasota  on 4/22/22.


import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "gloGuy") as! SKSpriteNode
        
        let topLeft = CGPoint(x: -frame.origin.x, y: frame.origin.y)
        let topRight = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let top = SKNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        top.physicsBody?.contactTestBitMask = 1
        addChild(top)
        func didBegin(_ contact: SKPhysicsContact){
            
           // if contact.top.node?.name == "top" && contact.player.node?.name == "gloGuy" {
        }
            
        backgroundColor = SKColor.purple
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 800.0))
        }
    }
    
    }
}
