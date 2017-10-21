//
//  TargetingComponent.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/21/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import GameKit

class TargetingComponent: GKAgent2D {
    
    let target:GKAgent2D
    
    required init(withTargetAgent targetAgent:GKAgent2D) {
        
        target = targetAgent
        
        super.init()
        
        let seek = GKGoal(toSeekAgent: targetAgent)
        
        self.behavior = GKBehavior(goals: [seek], andWeights: [1])
        
        self.maxSpeed = 4000
        self.maxAcceleration = 4000
        self.mass = 0.4
    }

}
