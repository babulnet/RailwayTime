//
//  TrainListProtocol.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

protocol TrainListViewProtocol: class, CommonViewProtocol {
    var presenter: TrainListPresenterProtocol? { get set }
    
    func showTrainList()
    func showError(_ message: String)
}

protocol TrainListWireframeProtocol: class {
    static func createTrainListModule(for station: Station) -> UIViewController
}

protocol TrainListPresenterProtocol: class {
    weak var view: TrainListViewProtocol? { get set }
    var interactor: TrainListPresenterToInteractor? { get set }
    var wireframe: LiveModuleWireFrameProtocol? { get set }
    var station: Station? { get set }
    var trainList: [Train] { get set }
    
    func getTrainList()
    func showTrainDetails(_ index: Int)
    func getCellInfo(index: Int) -> (name: String, origin: String, destination: String, status: String, dueIn: String)
}

protocol TrainListInteractorToPresenter: class {
    func didRetrieveTrainList(_ trains: [Train])
    func onError(_ message: String)
}

protocol TrainListPresenterToInteractor: class {
    weak var presenter: TrainListInteractorToPresenter? { get set }
    var apiClient: TrainListApiClient? { get set }
    
    func getTrainList(stationCode: String)
}

protocol TrainListApiClient: class {
    func getTrainList(code: String, onCompletion: @escaping (Bool, [Train]) -> Void)
}

