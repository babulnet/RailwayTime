//
//  TrainListWireframe.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit

class TrainListWireframe: TrainListWireframeProtocol {
    static func createTrainListModule(for station: Station) -> UIViewController {
        let trainListView = TrainListViewController()
        let presenter: TrainListPresenterProtocol & TrainListInteractorToPresenter = TrainListPresenter()
        let interactor: TrainListPresenterToInteractor = TrainListInteractor()
        let aTrainListApiClient: TrainListApiClient = TrainsListApiClient()
        let wireframe = LiveTrainSearchWireframe()
        
        trainListView.presenter = presenter
        
        presenter.view = trainListView
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.station = station
        
        interactor.presenter = presenter
        interactor.apiClient = aTrainListApiClient
        
        return trainListView
    }
}
