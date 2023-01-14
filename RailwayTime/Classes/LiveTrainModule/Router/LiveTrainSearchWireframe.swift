//
//  LiveTrainSearchWireframe.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit

class LiveTrainSearchWireframe: LiveModuleWireFrameProtocol {
    func showTrainListForStation(station: Station, view: CommonViewProtocol) {
        let trainListView = TrainListWireframe.createTrainListModule(for: station)
        
        if let aViewController = view as? UIViewController {
            aViewController.navigationController?.pushViewController(trainListView, animated: true)
        }
    }
    
    func showTrainDetailView(train: Train, view: CommonViewProtocol) {
        let trainDetailsVc = TrainDetailsWireframe.createTrainDetailsModule(for: train)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(trainDetailsVc, animated: true)
        }
    }
}
