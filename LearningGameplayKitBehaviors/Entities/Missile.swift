//
//  Missile.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/21/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import GameKit
import SpriteKit

class Missile: NodeEntity, GKAgentDelegate {

    let missileNode = MissileNode()
    
    required init(withTargetAgent targetAgent:GKAgent2D) {
        super.init()
        
        let renderComponent = RenderComponent(entity: self)
        renderComponent.node.addChild(missileNode)
        addComponent(renderComponent)
        
        let targetingComponent = TargetingComponent(withTargetAgent: targetAgent)
        targetingComponent.delegate = self
        addComponent(targetingComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupEmitters(withTargetScene scene:SKScene) {
        missileNode.setupEmitters(withTargetScene: scene)
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        if let agent2d = agent as? GKAgent2D {
            node.position = CGPoint(x: CGFloat(agent2d.position.x), y: CGFloat(agent2d.position.y))
            node.zRotation = CGFloat(agent2d.rotation)
        }
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        if let agent2d = agent as? GKAgent2D {
            agent2d.position = float2(Float(node.position.x), Float(node.position.y))
            agent2d.rotation = Float(node.zRotation)
        }
    }
    
}
