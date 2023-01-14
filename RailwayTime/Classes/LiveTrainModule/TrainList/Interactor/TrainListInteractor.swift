//
//  TrainListInteractor.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import Reachability

class TrainListInteractor: TrainListPresenterToInteractor {
    weak var presenter: TrainListInteractorToPresenter?
    var apiClient: TrainListApiClient?
    
    let reachability = Reachability()!
    
    func getTrainList(stationCode: String) {
        if reachability.connection != .none {
            apiClient?.getTrainList(code: stationCode, onCompletion: { [weak self] (success, results) in
                if success {
                    self?.presenter?.didRetrieveTrainList(results)
                } else {
                    self?.presenter?.onError("An Error Occured")
                }
            })
        } else {
            presenter?.onError("Please check the internet connection.")
        }
    }
    
}
