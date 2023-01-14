//
//  TrainDetailsApiClient.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Alamofire
import SwiftyXMLParser

class TrainDetailApiClient: TrainDetailsApiClient {
    func getTrainDetails(code: String, and date: String, onCompletion: @escaping (Bool, [TrainStop]) -> Void) {
        Alamofire.request("\(NetworkConstants.API.trainDetailURL)\(code.trimmingCharacters(in: .whitespaces))\(NetworkConstants.API.trainDetailQueryURL)\(String(describing: date.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!))", parameters: nil)
            .response { response in
                if let data = response.data {
                    if response.error == nil {
                        var dataArray = [TrainStop]()
                        let xml = XML.parse(data)
                        
                        for element in xml[NetworkConstants.APIKeys.trainDetailXMLPrimaryKey,
                                           NetworkConstants.APIKeys.trainDetailXMLSecondaryKey] {
                                            dataArray.append(TrainStop(xmlObject: element))
                        }
                        
                        onCompletion(true, dataArray.sorted { $0.locationOrder < $1.locationOrder })
                        return
                    }
                }
                
                onCompletion(false, [])
        }
    }
}
