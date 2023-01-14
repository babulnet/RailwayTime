//
//  StationSearchPresenter.swift
//  RailwayTime
//
//  Created by Raj,Babul on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation

class StationSearchPresenter:StationSearchPresenterProtocol, StationSearchInteractorToPresenter {
    
    var resultDelegate: StationSearchResultProtocol?
    
    var view: StationSearchViewProtocol?
    var interactor: StationSearchPresenterToInteractor?
    var wireFrame: StationSearchWireframeProtocol?
    var filteredArray: [Station]?
    var stationArray: [Station]?
    var isSearchOn = false
    var selectedStation: Station?
    
    func filerStationArray(text: String) {
        self.filteredArray = self.stationArray?.filter({$0.name.lowercased().prefix(text.count) == text.lowercased()})
        self.view?.showStationList()
    }
    
    func getStationList() {
        self.interactor?.fetchStationList()
    }
    
    func didSelectStation(index: Int) {
        if isSearchOn {
            self.selectedStation = self.filteredArray?[index]
        } else {
            self.selectedStation = self.stationArray?[index]
        }
    }
   
    func getStationName(index: Int) -> String {
        if isSearchOn {
            let station = self.filteredArray?[index]
            return ("\(station?.name ?? "") - \(station?.code ?? "")")
        } else {
            let station = self.stationArray?[index]
            return ("\(station?.name ?? "") - \(station?.code ?? "")")
        }
    }
    
    func didEndSearch() {
        guard let aView = self.view else { return }
        wireFrame?.popTrainSeachView(view: aView)
        resultDelegate?.selectedStation(station: selectedStation)
    }
    
    func getNumberOfRows() -> Int {
        if isSearchOn {
            return self.filteredArray?.count ?? 0
        } else {
            return self.stationArray?.count ?? 0
        }
    }
    
    //MARK:INTERACTOR PROTOCOL
    
    func fetchSuccess(stationList: [Station]) {
        self.stationArray = stationList
        self.view?.showStationList()
    }
    
    func fetchFailed(_ message: String) {
        self.view?.showError(message)
    }
}
