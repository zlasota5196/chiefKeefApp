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
        let player = SKSpriteNode(imageNamed: "gloGuy")
        
        backgroundColor = SKColor.purple
        
    }
}
