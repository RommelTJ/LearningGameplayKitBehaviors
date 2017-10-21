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
    
    var lastUpdateTimeInterval: TimeInterval = 0
    
    lazy var componentSystems:[GKComponentSystem] = {
        let targetingSystem = GKComponentSystem(componentClass: TargetingComponent.self)
        let renderSystem = GKComponentSystem(componentClass: RenderComponent.self)
        return [targetingSystem, renderSystem]
    }()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        player.node.position = CGPoint(x: 100, y: 100)
        self.addChild(player.node)
        
        // Setup the missile entity with the player's agent as it's target.
        missile = Missile(withTargetAgent: player.agent)
        // Pass the scene to the setupEmitters function so that the emitters leave a trail, rather than moving with the
        // missile itself.
        missile!.setupEmitters(withTargetScene: self)
        self.addChild(missile!.node)
        
        // Add the player and missile entity components to the component systems
        for componentSystem in self.componentSystems {
            componentSystem.addComponent(foundIn: player)
            componentSystem.addComponent(foundIn: missile!)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            player.agent.position = float2(Float(location.x), Float(location.y))
            player.agent.delegate!.agentDidUpdate!(player.agent)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Calculate the amount of time since `update` was last called.
        let deltaTime = currentTime - lastUpdateTimeInterval
        
        // Update every component system in the componentSystems array with the delta time.
        for componentSystem in componentSystems {
            componentSystem.update(deltaTime: deltaTime)
        }
        
        lastUpdateTimeInterval = currentTime
    }
}
