//
//  Program.swift
//  LiftingApp
//
//  Created by Zachary Cox on 4/4/17.
//  Copyright © 2017 Zachary Cox. All rights reserved.
//

import UIKit

typealias Workout = [Activity]

class Program {
//    var lifts: Set<Lift>
    

    
    var workoutCycle = [Workout]()
    var dayOfProgram: Int = 0
    var hasRepVariation = false
    var exercises = [Activity]()
    
    var todaysWorkout: Workout {
        get {
            let cycleDay = dayOfProgram % workoutCycle.count
            return workoutCycle[cycleDay]
        }
    }
    
    func getWorkoutForDay(_ day: Int) -> Workout {
        let dayInCycle = day % workoutCycle.count
        return workoutCycle[dayInCycle]
    }
    
    
    
    init(reps: Int, sets: Int, lifts: [Lift], cycle: [Array<Int>]) {

        for lift in lifts {
            let activity = Activity(lift: lift, reps: reps, sets: sets)
            exercises.append(activity)
        }
        
        for workoutIntegerArray in cycle {
            var activities = [Activity]()
            for i in workoutIntegerArray {
                activities.append(exercises[i])
            }
            let workout = Workout(activities)
            workoutCycle.append(workout)
        }
    }
    
}

struct Activity {
    var lift: Lift
    var reps: Int
    var sets: Int
    
}
