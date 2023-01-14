//
//  TrainDetailsProtocols.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//


import UIKit

protocol TrainDetailsViewProtocol: class {
    var presenter: TrainDetailsPresenterProtocol? { get set }
    
    func showTrainDetails(_ train: Train)
    func showError(_ message: String)
}

protocol TrainDetailsWireframeProtocol: class {
    static func createTrainDetailsModule(for train: Train) -> UIViewController
}

protocol TrainDetailsPresenterProtocol: class {
    var view: TrainDetailsViewProtocol? { get set }
    var interactor: TrainDetailsPresenterToInteractor? { get set }
    var wireframe: TrainDetailsWireframeProtocol? { get set }
    var train: Train? { get set }
    
    func getTrainDetails()
    func getTextFontAndColor(index: Int) -> (text: String, font:UIFont, colour: UIColor)
}

protocol TrainDetailsInteractorToPresenter: class {
    func didRetrieveTrainDetails(_ trainStops: [TrainStop])
    func onError(_ message: String)
}

protocol TrainDetailsPresenterToInteractor: class {
    weak var presenter: TrainDetailsInteractorToPresenter? { get set }
    var apiClient: TrainDetailsApiClient? { get set }
    
    func getTrainDetails(code: String, and date: String)
}

protocol TrainDetailsApiClient: class {
    func getTrainDetails(code: String, and date:String, onCompletion: @escaping (Bool, [TrainStop]) -> Void)
}

