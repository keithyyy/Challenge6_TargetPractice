//
//  Target.swift
//  Challenge6
//
//  Created by Keith Crooc on 2021-10-19.
//

import UIKit
import SpriteKit

class Target: SKNode {
    var isVisible = false
    var isHit = false
    
    var targetNode: SKSpriteNode!
    
    func configure(at position: CGPoint) {
        self.position = position
        
    }
    
}
