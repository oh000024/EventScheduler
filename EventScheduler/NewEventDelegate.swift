//
//  NewEventDelegate.swift
//  EventScheduler
//
//  Created by JakeOh on 2017-10-17.
//  Copyright © 2017 JakeOh. All rights reserved.
//

import Foundation

protocol EventPassingDelegate {
    func passEventData(newItem: Event)
}
