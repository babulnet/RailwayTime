//
//  LiveTrainModuleProtocol.swift
//  RailwayTime
//
//  Created by Raj,Babul on 03/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation

protocol LiveModuleViewProtocol: CommonViewProtocol {
    var presenter: LiveModulePresenterProtocol? { get set }
    func updateFromAndToStations(fromStation: String?,toStation: String?)
}

protocol LiveModuleWireFrameProtocol: class {
    //static func presentLiveModule(fromView view: AnyObject)
    func showTrainListForStation(station: Station, view: CommonViewProtocol)
    func showTrainDetailView(train: Train, view: CommonViewProtocol) 
}

protocol LiveModulePresenterProtocol: class {
    var view: LiveModuleViewProtocol? { get set }
    var interactor: LiveModulePresenterToInteractor? { get set }
    var wireFrame: LiveModuleWireFrameProtocol? { get set }
    var selectedStation: Station?{ get set }
    
    
    func showLiveTrains()
    func didSelectTextField(type: FromToTextFieldType)
}

protocol LiveModulePresenterToInteractor: class {
    var presenter: LiveModuleInteractorToPresenter? { get set } //  for call back to Presenter
    func fetchData()
}

protocol LiveModuleInteractorToPresenter: class {
    func fetchSucess()
    func fetchFailed()
}


