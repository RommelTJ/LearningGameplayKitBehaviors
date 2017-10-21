//
//  MissileNode.swift
//  LearningGameplayKitBehaviors
//
//  Created by Rommel Rico on 10/21/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import GameKit
import SpriteKit

class MissileNode: EntityNode {

    func setupEmitters(withTargetScene scene:SKScene) {
        let smoke = NSKeyedUnarchiver.unarchiveObject(withFile: Bundle.main.path(forResource: "MissileSmoke", ofType: "sks")!) as! SKEmitterNode
        smoke.targetNode = scene
        self.addChild(smoke)
        
        let fire = NSKeyedUnarchiver.unarchiveObject(withFile: Bundle.main.path(forResource: "MissileFire", ofType: "sks")!) as! SKEmitterNode
        NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource("MissileFire", ofType:"sks")!) as! SKEmitterNode
        fire.targetNode = scene
        self.addChild(fire)
    }
    
}
