//
//  NewEventViewController.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-17.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {

    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var eventDes: UITextView!
    var delegate: EventPassingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressCreateNewEvent(_ sender: Any) {
        let date: Date? = eventDate.date
//        let tile: String?
//        let desscription: String?
        
//        guard let t = eventTitle.text, let d = eventDes.text else {
//            return
//        }
        
        if let tempdate = date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
            var thisDate = formatter.string(from: tempdate)
            thisDate = thisDate.replacingOccurrences(of: ",", with: "")
            let dateArray = thisDate.components(separatedBy: " ")

            thisDate = "\(dateArray[0]) \(dateArray[1])"
            delegate?.passEventData(newItem: Event(title: eventTitle.text!,description: eventDes.text,date: thisDate))
//            dismiss(animated: true, completion: nil)
//            self.dismiss(animated: false, completion: nil)
            self.performSegue(withIdentifier:"UnwindSegueTableView", sender: self)
        }
    }

    @IBAction func changeDate(_ sender: Any) {
        let date: Date = eventDate.date;
        let dateString = DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .short)
        
    }
}
