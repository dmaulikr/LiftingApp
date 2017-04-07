//
//  WorkoutTableViewController.swift
//  LiftingApp
//
//  Created by Zachary Cox on 4/5/17.
//  Copyright © 2017 Zachary Cox. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    var workout: Workout?
    var program: Program?
    var numberOfWorkoutsCompleted = 0
    
    @IBAction func setComplete(_ sender: UIButton) {
        print("Ding")
        if sender.backgroundImage(for: .normal) == UIImage(named: "filledCircle")
        {
            sender.setBackgroundImage(UIImage(named: "emptyCircle"), for: .normal)
        } else {
            sender.setBackgroundImage(UIImage(named: "filledCircle"),
                                      for: .normal)
        }

    }
    

    let deadlift = Lift(name: "Deadlift", startingWeight: 65, progressionPace: 10)
    let squat = Lift(name: "Squat", startingWeight: 45, progressionPace: 5)
    let bench = Lift(name: "Bench", startingWeight: 45, progressionPace: 5)
    let overheadPress = Lift(name: "Overhead Press", startingWeight: 45, progressionPace: 5)
    let pendlayRow = Lift(name: "Pendlay Row", startingWeight: 65, progressionPace: 5)
    
    func makeStronglifts() {
        
//        let stronglifts = [[squat, bench, pendlayRow], [squat, overheadPress, deadlift]]
        
        let strongliftsLift = [deadlift, squat, bench, overheadPress, pendlayRow]
        let strongLifts = Program(reps: 5, sets: 5, lifts: strongliftsLift, cycle: [[1, 2, 4], [1, 3, 0]])
        
        program = strongLifts
        
//        let strongliftsSchema = Workout(intensity: 1, sets: 5, reps: 5, liftSets: stronglifts)
    }
    
    func assignTodaysWorkout() {
        workout = program?.getWorkoutForDay(numberOfWorkoutsCompleted)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        makeStronglifts()
        assignTodaysWorkout()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return workout!.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lift", for: indexPath)
        if let liftCell = cell as? LiftCell {
            if let activity = workout?[indexPath.section] {
                liftCell.nameLabel?.text = activity.lift.name
                liftCell.weightLabel?.text = String(activity.lift.workingWeight) + " lbs"
                addSetsToButtonStack(liftCell.buttonStack, sets: activity.sets)
            }
        }
        // Configure the cell...

        return cell
    }
    
    func addSetsToButtonStack(_ stackView: UIStackView, sets: Int) {
        var counter = 1
        //            let margins = buttonStack.layoutMarginsGuide
         //var existingButton = stackView.subviews[0] as! UIButton
        stackView.axis = .horizontal
        for _ in 0 ..< sets {
            let newButton = UIButton()
            newButton.translatesAutoresizingMaskIntoConstraints = false
            newButton.setBackgroundImage(UIImage(named: "emptyCircle"),
                                         for: .normal)
            newButton.widthAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
            newButton.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
            newButton.addTarget(self, action: #selector(self.setComplete), for: .touchUpInside)
            newButton.layer.cornerRadius = 20
            newButton.clipsToBounds = true
            
            stackView.addArrangedSubview(newButton)
            print(stackView.subviews.count)
            
            counter += 1
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        headerView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection: Int) -> CGFloat {
        return CGFloat(15)
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
