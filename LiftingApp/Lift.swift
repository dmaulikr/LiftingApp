//
//  Lift.swift
//  LiftingApp
//
//  Created by Zachary Cox on 4/4/17.
//  Copyright © 2017 Zachary Cox. All rights reserved.
//

import UIKit

class Lift: Any, Hashable, Equatable{
    let name: String
    let startingWeight: Int
    
    let progressionPace: Int
    var numSuccessfulWorkouts = 0 {
        didSet {
            workingWeight = startingWeight + (progressionPace * numSuccessfulWorkouts)
        }
    }
    var workingWeight: Int = 0
    
    
    init(name: String, startingWeight: Int, progressionPace: Int) {
        self.name = name
        self.startingWeight = startingWeight
        self.progressionPace = progressionPace
        self.workingWeight = startingWeight
    }
    
    internal var hashValue: Int {
        get {
            return name.hashValue
        }
    }
    
    
}

func ==(lhs: Lift, rhs: Lift) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
