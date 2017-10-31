//
//  SchedulesTableViewController.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-10.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import UIKit

class SchedulesTableViewController: UITableViewController, EventPassingDelegate{

    @IBOutlet var scheventTableView: UITableView!
    let sobj: Schedule = Schedule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Basic Testing Data
        let event1: Event = Event(title: "Eating out", description: "Meet Seb in REDROCK", date: "2017/12/23 12:00")
        let event2: Event = Event(title: "Workingout", description: "Take Water", date: "2017/11/23 12:00")
        let event3: Event = Event(title: "Watchin movie", description: "With Sally", date: "2017/10/23 12:00")

        sobj.addNewEvent(newItem: event1)
        sobj.addNewEvent(newItem: event2)
        sobj.addNewEvent(newItem: event3)
    }
    
    // Showing a NewEvent Page
    @IBAction func pressNewEventButton(_ sender: Any) {
        performSegue(withIdentifier: "ShowNewEvent", sender: self)
    }
    
    // delegate function, caller will call it by delegate
    func passEventData(newItem: Event) {
        sobj.addNewEvent(newItem: newItem)
        self.tableView?.reloadData()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    // return count of array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sobj.eventArray.count
    }

    // Showing cell on tableView is set by basic information
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        if let eventTitle = sobj.eventArray[indexPath.row].title {
            cell.textLabel?.text = "Title: \(eventTitle)"
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            sobj.eventArray.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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

    
    // MARK: - Navigation
    // Before going to next page, to set neccessary data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowEventInfo"{
            let nextViewController = segue.destination as? EventInfoViewController
            
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else{
//                UIAlertAction()
                return
            }
            nextViewController?.tempEvent = sobj.eventArray[indexPath.row]
            
        } else if segue.identifier == "ShowNewEvent"{
            ///set delegate to the initial tableViewController class
             let nextViewController = segue.destination as? NewEventViewController
            nextViewController?.delegate = self
        }
    }

}
