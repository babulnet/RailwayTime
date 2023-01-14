//  TrainDetailsWireframe.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//


import UIKit

class TrainDetailsWireframe: TrainDetailsWireframeProtocol {
    class func createTrainDetailsModule(for train: Train) -> UIViewController {
        let view = TrainDetailsViewController()
        let presenter: TrainDetailsPresenterProtocol & TrainDetailsInteractorToPresenter = TrainDetailsPresenter()
        let interactor: TrainDetailsPresenterToInteractor = TrainDetailsInteractor()
        let dataManager: TrainDetailsApiClient = TrainDetailApiClient()
        let wireframe: TrainDetailsWireframeProtocol = TrainDetailsWireframe()

        view.presenter = presenter
        view.title = "\(train.type) - \(train.code)"
        
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.train = train

        interactor.presenter = presenter
        interactor.apiClient = dataManager
        
        return view
    }
}
