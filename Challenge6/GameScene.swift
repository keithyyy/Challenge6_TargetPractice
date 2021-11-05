//
//  GameScene.swift
//  Challenge6
//
//  Created by Keith Crooc on 2021-10-18.
//

//  Make some targets big and slow, and others small and fast. The small targets should be worth more points.
//  Add “bad” targets – things that cost the user points if they get shot accidentally.
//  Make the top and bottom rows move left to right, but the middle row move right to left.
//  Add a timer that ticks down from 60 seconds. When it hits zero, show a Game Over message.
//  Try going to https://openclipart.org/ to see what free artwork you can find.
//  Give the user six bullets per clip. Make them tap a different part of the screen to reload.
//  Those are just suggestions – it’s your game, so do what you like!

import SpriteKit

class GameScene: SKScene {
    
    var scoreLabel: SKLabelNode!
    
    var possibleTargets = ["TargetGood", "TargetBad"]
    var isGameOver = false
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var gameTimer: Timer?
    
    override func didMove(to view: SKView) {
       let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        background.size = CGSize(width: 1080, height: 800)
        addChild(background)
        
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        for i in 1...2 { createTargetLeft(at: CGPoint(x: 275 - (i * 100) , y: 168 + (i * 30)))}

//        create middle targets
        createTargetMid(at: CGPoint(x: 347, y: 172), name: "MidTarget1")
        createTargetMid(at: CGPoint(x: 427, y: 277), name: "MidTarget2" )
  
        
//        create right targets
        createTargetRight(at: CGPoint(x: 833, y: 120), name: "RightTarget1")
        createTargetRight(at: CGPoint(x: 964, y: 120), name: "RightTarget2")
    }
    
   
    func createTargetLeft(at position: CGPoint) {
        guard let target = possibleTargets.randomElement() else { return }
        
        let targetSprite = SKSpriteNode(imageNamed: target)
        targetSprite.position = position
        targetSprite.size = CGSize(width: 100, height: 100)
        addChild(targetSprite)
        
        
        
    }
    
    
    func createTargetMid(at position: CGPoint, name: String) {
        guard let target = possibleTargets.randomElement() else { return }
        
        let targetSprite = SKSpriteNode(imageNamed: target)
        targetSprite.position = position
        targetSprite.size = CGSize(width: 100, height: 100)
        targetSprite.name = name
        addChild(targetSprite)
        
        
        targetSprite.physicsBody = SKPhysicsBody(texture: targetSprite.texture!, size: targetSprite.size)
        
//        we want the target to float. Gotta set the gravity of this target to be 0 so it doesn't fall
        physicsWorld.gravity = .zero
        
//        let xValue = CGFloat(position.x)
        let yValue = CGFloat(position.y)
        
        let xValue = CGFloat.random(in: 347...470)
        
        let speed = Double.random(in: 1...2)
        
        
        let moveRight = SKAction.move(to: CGPoint(x: xValue + 300, y: yValue), duration: TimeInterval(speed))
        let moveLeft = SKAction.move(to: CGPoint(x: xValue - 30, y: yValue), duration: TimeInterval(speed))
        
        targetSprite.run(SKAction.repeatForever(SKAction.sequence([moveRight, moveLeft])))
        
    }
    
    
    
    func createTargetRight(at position: CGPoint, name: String) {
        guard let target = possibleTargets.randomElement() else { return }
        
        let targetSprite = SKSpriteNode(imageNamed: target)
        targetSprite.position = position
        targetSprite.size = CGSize(width: 100, height: 100)
        targetSprite.name = name
        addChild(targetSprite)
    }
    
    
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        print(location)
        
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//
//        let location = touch.location(in: self)
//
//        print(location)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
