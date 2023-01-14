//
//  Station.swift
//  RailwayTime
//
//  Created by Babul Raj on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//


// stationName
// stationCode
// stationID

import Foundation
import SwiftyXMLParser

struct Station {
    let id: Int
    let code: String
    let name: String
    let latitude: Float?
    let longitude: Float?
}

extension Station {
    init(xmlObject: XML.Accessor.Element) {
        var text: String
        
        if
            let alias = xmlObject["StationAlias"].text,
            alias.count > 0 {
            if
                let description = xmlObject["StationDesc"].text,
                description.count > 0 {
                text = description
            } else {
                text = alias
            }
        } else {
            if
                let description = xmlObject["StationDesc"].text,
                description.count > 0 {
                text = description
            } else {
                text = "Information Unavailable"
            }
        }
        
        name = text
        latitude = Float(xmlObject["StationLatitude"].text ?? "")
        longitude = Float(xmlObject["StationLongitude"].text ?? "")
        code = xmlObject["StationCode"].text ?? "N/A"
        id = Int(xmlObject["StationId"].text ?? "") ?? 0
    }
}
