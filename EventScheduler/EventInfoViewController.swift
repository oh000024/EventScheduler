//
//  EventInfoViewController.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-17.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {

    @IBOutlet weak var myScheduleTitle: UILabel!
    @IBOutlet weak var myScheduleDate: UILabel!
    @IBOutlet weak var myScheduleDescription: UILabel!
    
    var tempEvent: Event?
    
    var eTitle: String?
    var date: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard  tempEvent != nil else{
            return
        }
        if let tile = tempEvent?.title {
            myScheduleTitle.text = tile;
        }
        if let date = tempEvent?.date?.description {
            myScheduleDate.text = date;
        }
        if let desc = tempEvent?.description {
            myScheduleDescription.text = desc;
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
