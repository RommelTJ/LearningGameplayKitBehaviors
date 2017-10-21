//
//  PlayerNode.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/21/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import SpriteKit
import GameKit

class PlayerNode: EntityNode {

    let shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        shape.fillColor = .yellow
        addChild(shape)
    }
    
}
