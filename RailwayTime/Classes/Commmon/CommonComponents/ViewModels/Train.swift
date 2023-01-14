//
//  Trains.swift
//  RailwayTime
//
//  Created by Babul Raj on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct Train {
    let code: String
    let type: String
    let origin: String
    let originTime: String
    let destination: String
    let destinationTime: String
    let date: String
    let comingIn: Int
    let status: String
    let late: String
    let lastKnownLocation: String
    
    var stops = [TrainStop]()
}

extension Train {
    init(xmlObject: XML.Accessor.Element) {
        code = xmlObject["Traincode"].text ?? "N/A"
        date = xmlObject["Traindate"].text ?? "N/A"
        origin = xmlObject["Origin"].text ?? "N/A"
        originTime = xmlObject["Origintime"].text ?? "N/A"
        destination = xmlObject["Destination"].text ?? "N/A"
        destinationTime = xmlObject["Destinationtime"].text ?? "N/A"
        late = xmlObject["Late"].text ?? "N/A"
        status = xmlObject["Status"].text ?? "N/A"
        lastKnownLocation = xmlObject["Lastlocation"].text ?? "N/A"
        type = xmlObject["Traintype"].text ?? "N/A"
        comingIn = Int(xmlObject["Duein"].text ?? "0") ?? 0
    }
}

