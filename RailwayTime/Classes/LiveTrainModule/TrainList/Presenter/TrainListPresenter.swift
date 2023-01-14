//
//  TrainListPresenter.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation

class TrainListPresenter: TrainListPresenterProtocol {
    
    weak var view: TrainListViewProtocol?
    var interactor: TrainListPresenterToInteractor?
    var wireframe: LiveModuleWireFrameProtocol?
    var station: Station?
    var trainList = [Train]()

    func getTrainList() {
        if let code = station?.code {
            interactor?.getTrainList(stationCode: code)
        }
    }

    func showTrainDetails(_ index: Int) {
        if let view = view {
            wireframe?.showTrainDetailView(train: trainList[index], view: view)
        }
    }
    
    func getCellInfo(index: Int) -> (name: String, origin: String, destination: String, status: String, dueIn: String) {
        let train = self.trainList[index]
        
        let name = "\(train.type) ( \(train.code))"
        let origin = train.origin
        let destination = train.destination
        let status = train.status
        let dueIn = "\(train.comingIn) min"
        
        return (name: name, origin: origin, destination: destination, status: status, dueIn: dueIn)
    }
}

extension TrainListPresenter: TrainListInteractorToPresenter {
    func didRetrieveTrainList(_ trains: [Train]) {
        trainList = trains
        view?.showTrainList()
    }

    func onError(_ message: String) {
        view?.showError(message)
    }
}
