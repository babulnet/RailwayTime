//
//  CommonWireFrame.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit

class CommonWireFrame: CommonRouterProtocol {
    func showStationSearchView(view: CommonViewProtocol, resultDelegate: StationSearchResultProtocol) {
        let stationSearchView = StationSearchWireFrame.createStationSearchView(view: view, resultDelegate: resultDelegate)
       
        if let aViewController = view as? UIViewController {
            aViewController.navigationController?.pushViewController(stationSearchView, animated: true)
        }
    }
    
   
    
//    static func popTrainSeachView(view: StationSearchViewProtocol) {
//        if let aViewController = view as? UIViewController {
//            aViewController.navigationController?.popViewController(animated: true)
//        }
//    }
//
//    static func showStationSearchView(view: CommonViewProtocol,resultDelegate: StationSearchResultProtocol) {
//        let searchView = mainstoryboard.instantiateViewController(withIdentifier: "StationSearchViewController") as! StationSearchViewController
//        if let aViewController = view as? UIViewController {
//            aViewController.navigationController?.pushViewController(searchView, animated: true)
//        }
//
//        let stationSearchPresenter = StationSearchPresenter()
//        stationSearchPresenter.resultDelegate = resultDelegate
//        stationSearchPresenter.view = searchView
//        stationSearchPresenter.wireFrame = StationSearchWireFrame()
//
//        let stationSearchInteractor = StationSearchInteractor()
//        stationSearchInteractor.presenter = stationSearchPresenter
//        stationSearchPresenter.interactor = stationSearchInteractor
//        stationSearchInteractor.apiClient = StationsSearchAPIClient()
//
//        searchView.presenter = stationSearchPresenter
//    }
}
