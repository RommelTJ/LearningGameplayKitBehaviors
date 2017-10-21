//
//  GameScene.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/20/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player: Player = Player()
    var missile: Missile?
    
    lazy var componentSystems:[GKComponentSystem] = {
        let targetingSystem = GKComponentSystem(componentClass: TargetingComponent.self)
        let renderSystem = GKComponentSystem(componentClass: RenderComponent.self)
        return [targetingSystem, renderSystem]
    }()
    
    override func didMove(to view: SKView) {
        
        // TODO
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
