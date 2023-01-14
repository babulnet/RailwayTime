//
//  RootWireFrame.swift
//  RailwayTime
//
//  Created by Raj,Babul on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class StationSearchWireFrame : StationSearchWireframeProtocol {
    static func createStationSearchView(view: CommonViewProtocol, resultDelegate: StationSearchResultProtocol) -> UIViewController {
        let searchView = mainstoryboard.instantiateViewController(withIdentifier: "StationSearchViewController") as! StationSearchViewController
        
        let stationSearchPresenter = StationSearchPresenter()
        stationSearchPresenter.resultDelegate = resultDelegate
        stationSearchPresenter.view = searchView
        stationSearchPresenter.wireFrame = StationSearchWireFrame()
        
        let stationSearchInteractor = StationSearchInteractor()
        stationSearchInteractor.presenter = stationSearchPresenter
        stationSearchPresenter.interactor = stationSearchInteractor
        stationSearchInteractor.apiClient = StationsSearchAPIClient()
        
        searchView.presenter = stationSearchPresenter
        return searchView
    }

    func popTrainSeachView(view: StationSearchViewProtocol) {
        if let aViewController = view as? UIViewController {
            aViewController.navigationController?.popViewController(animated: true)
        }
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
