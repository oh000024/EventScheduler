//
//  Event.swift
//  BuildEventSchedule
//
//  Created by JakeOh on 2017-09-25.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import Foundation

class Event{
    
    var title: String? = "MAD9036"
    var description: String? = "Event and Schedule"
    var date: Date?
    
    /*
     Initialize properties
     RETURN: VOID
     */
    init(title: String, description: String){
        self.title = title;
        self.description = description;
    }
    
    /*
     Initialize properties
     RETURN: VOID
     */
    convenience init(title: String, description: String, date: String){
        self.init(title: title, description: description)
        self.setDate(formatedDateString: date)
    }
    /*
     //
     // Setting date, String to Date
     // RETURN TYPE : VOID
    */
    func setDate(formatedDateString: String){
        let formatting = DateFormatter()
        formatting.timeZone = TimeZone(abbreviation: "UTC")
        formatting.dateFormat = "yyyy/MM/dd HH:mm"
        self.date = formatting.date(from: formatedDateString)!
    }
    /*
    // Returning property
    // RETURN TYPE : STRING
    */
    func getInfo()-> String{
        return ("Title: \(self.title!)\nDate: \(self.date!.description)\nDescription: \(self.description!)\n=======================\n");
    }
}
