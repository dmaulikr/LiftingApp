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
    
    
    // Major mode
    var exercises = [Activity]()
    
    var workoutCycle = [Workout]()
    
    var dayOfProgram: Int = 0
    
    var hasRepVariation = false
    
    
    var todaysWorkout: Workout {
        get {
            let cycleDay = dayOfProgram % workoutCycle.count
            return workoutCycle[cycleDay]
        }
    }
    
    func getWorkingWeightOf(_ lift: Lift) -> Int {
        for exercise in exercises {
            if exercise.lift == lift {
                return exercise.lift.workingWeight
            }
        }
        return lift.startingWeight
    }
    
    func markSuccessForLift(_ lift: Lift) {
        for exercise in exercises {
            if exercise.lift == lift {
                let previousWorkingWeight = exercise.lift.workingWeight
                exercise.lift.workingWeight = previousWorkingWeight + exercise.lift.progressionPace
            }
        }
    }
    
    func getWorkoutCycleForDay(_ day: Int) -> Workout {
        let dayInCycle = day % workoutCycle.count
        let workout = workoutCycle[dayInCycle]
        var outgoingWorkout: Workout = [Activity]()
        
        for activity in workout {
            for exercise in exercises {
                if activity.lift.name == exercise.lift.name {
                    outgoingWorkout.append(exercise)
                }
            }
        }
        
        return outgoingWorkout
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
