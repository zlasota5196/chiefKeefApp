//
//  GameScene.swift
//  chiefKeefApp
// /
//  Created by Zuzu Lasota  on 4/22/22.
//squad


import SpriteKit
import GameplayKit

let middlePlatforms: UInt32 = 1

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ColorChoices = [0,1,2,3,4]
    var ComputerColorChoice = 0
    var player = SKSpriteNode()
    var label = SKLabelNode()
    var middleLeftPlatform =  SKSpriteNode()
    var middleRightPlatform = SKSpriteNode()
    var number = 0
    var scoreLabel = SKLabelNode()
    
    let bottom = CGPoint(x: -6.139, y: -566.201)
    let resetSize = CGSize(width: 165.877, height: 149.343)
    
    
    
    override func didMove(to view: SKView) {
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
       
        player = self.childNode(withName: "gloGuy") as! SKSpriteNode
        label = self.childNode(withName: "label") as! SKLabelNode
        middleLeftPlatform = self.childNode(withName: "middleLeftPlatform") as! SKSpriteNode
        middleRightPlatform = self.childNode(withName: "middleRightPlatform") as! SKSpriteNode

        let topLeft = CGPoint(x: frame.origin.x, y: -frame.origin.y)
        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
        let top = SKNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        top.physicsBody?.contactTestBitMask = 1
        addChild(top)
        backgroundColor = SKColor.purple
        print(frame.origin.y)
        

        middleLeftPlatform.physicsBody?.categoryBitMask = middlePlatforms
        middleRightPlatform.physicsBody?.categoryBitMask = middlePlatforms
        
        player.physicsBody?.categoryBitMask = middlePlatforms
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 800.0))
            label.alpha = 0
        }
    }

     
    func didBegin(_ contact: SKPhysicsContact) {
       
        if contact.bodyA.node?.name == "top" && contact.bodyB.node?.name == "gloGuy" {
            player.removeFromParent()
            label.alpha = 1
            number = number + 1
            
            print("touched")
            print(player.position)
            
            player = SKSpriteNode(imageNamed: "gloGuy")
            player.position = bottom
            player.size = resetSize
            player.name = "gloGuy"
            player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width/2)
            self.addChild(player)
    
            self.ComputerColorChoice = ColorChoices.randomElement()!
            if ComputerColorChoice == 0 {
                backgroundColor = SKColor.orange
            } else if ComputerColorChoice == 1 {
                backgroundColor = SKColor.blue
            } else if ComputerColorChoice == 2 {
                backgroundColor = SKColor.green
            } else if ComputerColorChoice == 3 {
                backgroundColor = SKColor.yellow
            } else if ComputerColorChoice == 4 {
                backgroundColor = SKColor.brown
            }
        }
        print("bodyA = \( contact.bodyA.node?.name)")
        print("bodyB = \(contact.bodyB.node?.name)")
        
        if contact.bodyA.categoryBitMask == middlePlatforms{
            platformTouched(node:middleRightPlatform)
            
        }
        
        else if contact.bodyA.categoryBitMask == middlePlatforms{
            platformTouched(node:middleLeftPlatform)
            
        }
        
        
    }
    
    func platformTouched(node: SKSpriteNode){
        node.removeAllChildren()
        node.removeFromParent()
        
    }
    
    
    
    }
    
 

