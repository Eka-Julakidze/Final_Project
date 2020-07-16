//
//  Model.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit    
public struct Response: Codable {
    let tourName, category, distance: String
    let duration: Duration
    let rating, lat, lng: String
   
}

enum Duration: String, Codable {
    case the1Day = "1 day"
    case the2Day = "2 day"
    case the2Days = "2 days"
    case the5Days = "5 days"
}

typealias tourResponse = [Response]
public var arr = [Response]()


