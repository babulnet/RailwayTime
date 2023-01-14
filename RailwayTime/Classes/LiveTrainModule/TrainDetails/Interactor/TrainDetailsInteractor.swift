//
//  TrainDetailsInteractor.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//


import Foundation
import Reachability

class TrainDetailsInteractor: TrainDetailsPresenterToInteractor {
    
    weak var presenter: TrainDetailsInteractorToPresenter?
    var apiClient: TrainDetailsApiClient?

    let reachability = Reachability()!

    func getTrainDetails(code: String, and date: String) {
        if reachability.connection != .none {
            apiClient?.getTrainDetails(code: code, and: date, onCompletion: { [weak self] (success, result) in
                if success {
                    self?.presenter?.didRetrieveTrainDetails(result)
                } else {
                    self?.presenter?.onError("An Error Occured")
                }
            })
        }
        else {
            presenter?.onError("Please check the internet connection.")
        }
    }
}
