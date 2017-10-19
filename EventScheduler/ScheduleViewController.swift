//
//  ScheduleViewController.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-10.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var myScheduleTitle: UILabel!
    @IBOutlet weak var myScheduleDate: UILabel!
    @IBOutlet weak var myScheduleDescription: UILabel!
    
    var eTitle: String?
    var date: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let title = eTitle {
            myScheduleTitle.text = title;
        }
        if let date = date {
            myScheduleDate.text = date;
        }
        if let desc = desc {
            myScheduleDescription.text = desc;
        }
        // Do any additional setup after loading the view.
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
