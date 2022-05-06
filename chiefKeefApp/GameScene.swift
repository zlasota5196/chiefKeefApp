//
//  GameScene.swift
//  chiefKeefApp
//
//  Created by Zuzu Lasota  on 4/22/22.
//squad


import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    var label = SKLabelNode()
    let bottom = CGPoint(x: -6.139, y: -566.201)
    override func didMove(to view: SKView) {
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "gloGuy") as! SKSpriteNode
        label = self.childNode(withName: "label") as! SKLabelNode
//        print(frame.origin.y)
        let topLeft = CGPoint(x: frame.origin.x, y: -frame.origin.y)
        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
        let top = SKNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        top.physicsBody?.contactTestBitMask = 1
        addChild(top)
    
            
        backgroundColor = SKColor.purple
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 800.0))
            label.alpha = 0
            
        }
    }
     
    func didBegin(_ contact: SKPhysicsContact) {
       print(contact.bodyA.node?.name)
        if contact.bodyA.node?.name == "top" && contact.bodyB.node?.name == "gloGuy" {
            player.position = bottom
            label.alpha = 1
            print("touched")
        }
    }
    
    }

