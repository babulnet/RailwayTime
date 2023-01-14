//
//  NetworkConstants.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import Foundation

struct NetworkConstants {
    struct API {
        static let stationListURL = "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML"
        static let trainListURL = "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML?StationCode="
        static let trainDetailURL = "http://api.irishrail.ie/realtime/realtime.asmx/getTrainMovementsXML?TrainId="
        static let trainDetailQueryURL = "&TrainDate="
    }
    
    struct APIKeys {
        static let stationXMLPrimaryKey = "ArrayOfObjStation"
        static let stationXMLSecondaryKey = "objStation"
        
        static let trainXMLPrimaryKey = "ArrayOfObjStationData"
        static let trainXMLSecondaryKey = "objStationData"
        
        static let trainDetailXMLPrimaryKey = "ArrayOfObjTrainMovements"
        static let trainDetailXMLSecondaryKey = "objTrainMovements"
    }
}
