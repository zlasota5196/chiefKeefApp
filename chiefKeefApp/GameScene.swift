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
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "gloGuy") as! SKSpriteNode
        
        // var blockArray = ["block1","block2","block3","block4","block5","block6","block7","block8"]
   
        backgroundColor = SKColor.purple
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         for touch in touches {
              let location = touch.location(in: self)
              let touchedNode = atPoint(location)
              if touchedNode.name == "HelloButton" {
                   // Call the function here.
              }
         }
    }
    
    
}
