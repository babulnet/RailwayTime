//
//  TrainDetailsPresenter.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit

class TrainDetailsPresenter: TrainDetailsPresenterProtocol {
    
    weak var view: TrainDetailsViewProtocol?
    var interactor: TrainDetailsPresenterToInteractor?
    var wireframe: TrainDetailsWireframeProtocol?
    
    var train: Train?
    
    func getTrainDetails() {
        if let train = train {
            interactor?.getTrainDetails(code: train.code, and: train.date   )
        }
    }
    
    func getTextFontAndColor(index: Int) -> (text: String, font: UIFont, colour: UIColor) {
        
        guard let trainStop = train?.stops[index] else { return (text: "", font: UIFont(), colour: UIColor.clear) }
        
        let text = "\(trainStop.locationName) (\(trainStop.locationCode))"
        let themeColour = Theme.colour
        
        switch trainStop.type {
        case .current:
            return (text: text,font: UIFont.boldSystemFont(ofSize: 18.0),colour: themeColour)
        case .next:
            return (text: text,font: UIFont.systemFont(ofSize: 17.0),colour: UIColor.gray)
        case .none:
            return (text: text,font: UIFont.systemFont(ofSize: 17.0),colour: UIColor.gray)
        }
    }
}

extension TrainDetailsPresenter: TrainDetailsInteractorToPresenter {

    func didRetrieveTrainDetails(_ trainStops: [TrainStop]) {
        train?.stops = trainStops

        if let train =  train {
            view?.showTrainDetails(train)
        }
    }

    func onError(_ message: String) {
        view?.showError(message)
    }
}
