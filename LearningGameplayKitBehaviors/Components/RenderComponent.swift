//
//  RenderComponent.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/21/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import SpriteKit
import GameplayKit

class RenderComponent: GKComponent {

    // The `RenderComponent` vends a node allowing an entity to be rendered in a scene.
    let node = EntityNode()
    
    init(entity: GKEntity) {
        node.entity = entity
    }
    
}
