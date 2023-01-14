//
//  LiveTrainVCPresenter.swift
//  RailwayTime
//
//  Created by Babul Raj on 03/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit

class LiveTrainVCPresenter: LiveModulePresenterProtocol,LiveModuleInteractorToPresenter,StationSearchResultProtocol {
    
    var selectedStation: Station?
    var selectedTextFieldType: FromToTextFieldType?
    var searchStationWireframe: CommonRouterProtocol?
    var view: LiveModuleViewProtocol?
    var interactor: LiveModulePresenterToInteractor?
    var wireFrame: LiveModuleWireFrameProtocol?
    
    init() {
    }
    
    // MARK: LIVE MODUE PRESENTER PROTOCOL
   
    func didSelectTextField(type: FromToTextFieldType) {
        self.selectedTextFieldType = type
        guard let aView = self.view else { return }
        searchStationWireframe?.showStationSearchView(view: aView, resultDelegate: self)
    }
    
    func getViewUpdates() {
        
    }
    
    func showLiveTrains() {
        guard let aView = self.view, let aStation = self.selectedStation else {
            view?.showMessage(message: "Select a Station")
            return}
        self.wireFrame?.showTrainListForStation(station: aStation, view: aView)
    }
    
 // MARK INTERACTOR PROTOCOLS
    
    func fetchSucess() {
        //
    }
    
    func fetchFailed() {
        //
    }
    
    //MARK: STATION SEARCH RESULT
    
    func selectedStation(station: Station?) {
        self.selectedStation = station
        
        switch selectedTextFieldType {
        case .from?:
            view?.updateFromAndToStations(fromStation: station?.name, toStation: nil)
        case .to?:
            view?.updateFromAndToStations(fromStation: nil, toStation: station?.name)
        case .none:
            view?.updateFromAndToStations(fromStation: "From", toStation: "To")
        }
    }
}
