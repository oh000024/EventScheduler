//
//  SchedulesTableViewController.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-10.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import UIKit

class SchedulesTableViewController: UITableViewController, EventPassingDelegate{

    //var eventArrary: Array<Event>?
    var userArray: [String] = ["Seb","Ann","Je","Steve","Bill"]
    let sobj: Schedule = Schedule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding Event
        sobj.addNewEvent(title: "Getting Up", description: "Studying", dateString: "2017/09/22 13:00")
//        sobj.addNewEvent(title: "Eating", description: "Breakfirst", dateString: "2017/09/22 07:00")
//        sobj.addNewEvent(title: "Sleeping", description: "Taking a nap", dateString: "2017/09/22 22:00")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func pressNewEventButton(_ sender: Any) {
        performSegue(withIdentifier: "ShowNewEvent", sender: self)
    }
    @IBAction func unwindToTableView(segue:UIStoryboardSegue){
        
    }
    
    func passEventData(newItem: Event) {
//    sobj.addNewEvent(title: newItem.title!, description: newItem.description!, dateString: "2017/09/22 13:00")
    sobj.addNewEvent(newItem: newItem)
    self.tableView?.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sobj.eventArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)

        // Configure the cell...
//        if let events = sobj.eventArray {
//        cell.textLabel?.text = "Schedule \(String(describing: sobj.eventArray[indexPath.row].description))"
//        cell.textLabel?.text = "User \(userArray[indexPath.row])"
        if let eventTitle = sobj.eventArray[indexPath.row].title {
              cell.textLabel?.text = "Schedule \(eventTitle)"
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
            tableView.deleteRows(at: [indexPath], with: .fade)
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowEventInfo"{
            let nextViewController = segue.destination as? EventInfoViewController
            
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else{
                return
            }
            nextViewController?.tempEvent = sobj.eventArray[indexPath.row]
            
        } else if segue.identifier == "ShowNewEvent"{
             let nextViewController = segue.destination as? NewEventViewController
            nextViewController?.delegate = self
        }
    }

}
