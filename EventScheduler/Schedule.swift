//
//  Schedule.swift
//  BuildEventSchedule
//
//  Created by JakeOh on 2017-09-25.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import Foundation

class Schedule{
    
    /*
     //MEMBER Array for Event Object
     */
    var eventArray: Array<Event> = Array<Event>()
    
    /*
     //Get-Only eventcount
     */
    var eventCount: Int {
        guard self.eventArray.isEmpty != true else { return 0 }
        return eventArray.count
    }
    
    /*
     //Create Event Ojbect and Adding Event Object
     */
    func addNewEvent(title: String,description: String, dateString: String) {
        let eObj: Event =  Event(title: title, description: description, date: dateString)
        self.eventArray.append(eObj)
    }
    
    func addNewEvent(newItem: Event) {
        self.eventArray.append(newItem)
    }
    
    /*
     //Printing information of EventArray
     */
    func outputAllEvents()-> String{
        var message: String=""
        guard self.eventArray.isEmpty != true else{
            message = "Event is empty"
            return message
        }
        
        for event in self.eventArray {
            message.append("\(event.getInfo())\n")
        }
        return message
    }

}
