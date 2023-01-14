//
//  Protocols.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit
protocol StationSearchViewProtocol: class {
    var presenter: StationSearchPresenterProtocol? { get set }
    func showStationList()
    func showError(_ message: String)
}

protocol StationSearchPresenterProtocol: class {
    weak var view: StationSearchViewProtocol? { get set }
    var interactor: StationSearchPresenterToInteractor? { get set }
    var wireFrame: StationSearchWireframeProtocol? { get set }
    var filteredArray: [Station]? { get set }
    var stationArray: [Station]? { get set }
    var isSearchOn: Bool { get set }
    var selectedStation: Station? { get set }
    
    func getNumberOfRows() -> Int
    func didEndSearch()
    func getStationName(index: Int) -> String 
    func getStationList()
    func didSelectStation(index: Int)
    func filerStationArray(text: String)
}

protocol StationSearchResultProtocol {
    func selectedStation(station: Station?)
}

protocol StationSearchWireframeProtocol {
    static func createStationSearchView(view: CommonViewProtocol,resultDelegate: StationSearchResultProtocol) -> UIViewController
    func popTrainSeachView(view: StationSearchViewProtocol)
}

protocol StationSearchPresenterToInteractor: class {
    weak var presenter: StationSearchInteractorToPresenter? { get set}
    func fetchStationList()
}

protocol StationSearchInteractorToPresenter: class {
    func fetchSuccess(stationList: [Station])
    func fetchFailed(_ messsage: String)
}

protocol StaionSearchAPIClient: class {
    func fetchStationList(onCompletion: @escaping (Bool, [Station]) -> Void)
}
