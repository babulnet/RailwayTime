//
//  StationSearchInteractor.swift
//  RailwayTime
//
//  Created by Raj,Babul on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import Reachability

class StationSearchInteractor: StationSearchPresenterToInteractor {
    weak var presenter: StationSearchInteractorToPresenter?
    
    var apiClient: StaionSearchAPIClient?
    
    let reachability = Reachability()!
    
    func fetchStationList() {
        if reachability.connection != .none {
            apiClient?.fetchStationList(onCompletion: { [weak self] (success, results) in
                if success {
                    self?.presenter?.fetchSuccess(stationList: results)
                } else {
                    self?.presenter?.fetchFailed("An Error Occured")
                }
            })
        } else {
            presenter?.fetchFailed("Please check your internet connevtion.")
        }
    }
}
