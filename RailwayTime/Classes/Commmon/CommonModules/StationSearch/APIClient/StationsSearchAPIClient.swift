//
//  StationSearchParser.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyXMLParser

class StationsSearchAPIClient : StaionSearchAPIClient {
    func fetchStationList(onCompletion:@escaping (Bool, [Station]) -> Void) {
        Alamofire.request(NetworkConstants.API.stationListURL, parameters: nil)
            .response { response in
                if let data = response.data {
                    if response.error == nil {
                        let xml = XML.parse(data)
                        var dataArray = [Station]()
                        
                        for element in xml[NetworkConstants.APIKeys.stationXMLPrimaryKey,
                                           NetworkConstants.APIKeys.stationXMLSecondaryKey] {
                                            dataArray.append(Station(xmlObject: element))
                        }
                        
                        onCompletion(true, dataArray.sorted { $0.name < $1.name })
                        
                        return
                    }
                }
                
                onCompletion(false, [Station]())
        }
    }
}
