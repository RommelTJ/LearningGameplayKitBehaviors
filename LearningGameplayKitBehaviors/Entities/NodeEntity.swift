//
//  NodeEntity.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/21/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import GameKit

class NodeEntity: GKEntity {

    var node: EntityNode {
        get {
            return component(ofType: RenderComponent.self)!.node
        }
    }
    
}
