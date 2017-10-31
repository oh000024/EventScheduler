//
//  NewEventViewController.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-17.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var eventDes: UITextView!
    
    /// Usage: Optional delegate variable
    var delegate: EventPassingDelegate?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        eventTitle.delegate = self
//        eventDes.delegate = self
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        eventTitle.delegate = self
        eventDes.delegate = self
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    /// Usage: Action, on  tapping a Create New Event Button
    /// Return: ???
    ///
    @IBAction func pressCreateNewEvent(_ sender: Any) {
        eventDes.resignFirstResponder()
        eventTitle.resignFirstResponder()

        guard let title = eventTitle.text, title.isEmpty != true else {
            let alert = UIAlertController(title: "Error", message: "Please, enter valid information", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        //if let tempdate = eventDate.date {
            // call delegator's function to set the create event
            delegate?.passEventData(newItem: Event(title: eventTitle.text!,description: eventDes.text!,date: eventDate.date))
            
            navigationController?.popViewController(animated: true)
        //}
    }

    @IBAction func changeDate(_ sender: Any) {
        let date: Date = eventDate.date;
        print(DateFormatter.localizedString(from: date, dateStyle: .short, timeStyle: .short))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        eventDate.timeZone = NSTimeZone.local
        //print(timeLocal)
        print(eventDate.date.description)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eventTitle.resignFirstResponder()
        return false
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == ("\n") {
            eventDes.resignFirstResponder()
            return false
        }
        return true
    }
}
