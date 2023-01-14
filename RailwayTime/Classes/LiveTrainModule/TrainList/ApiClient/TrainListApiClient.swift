//
//  TrainListAPIClient.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Alamofire
import SwiftyXMLParser

class TrainsListApiClient: TrainListApiClient {
    func getTrainList(code: String, onCompletion: @escaping (Bool, [Train]) -> Void) {
        Alamofire
            .request("\(NetworkConstants.API.trainListURL)\(code)", parameters: nil)
            .response { response in
                if let data = response.data {
                    if response.error == nil {
                        let xml = XML.parse(data)
                        var dataArray = [Train]()

                        for element in xml[NetworkConstants.APIKeys.trainXMLPrimaryKey,
                                           NetworkConstants.APIKeys.trainXMLSecondaryKey] {
                            dataArray.append(Train(xmlObject: element))
                        }

                        onCompletion(true, dataArray.sorted { $0.comingIn < $1.comingIn })
                        return
                    }
                }
                onCompletion(false, [])
        }
    }
}
