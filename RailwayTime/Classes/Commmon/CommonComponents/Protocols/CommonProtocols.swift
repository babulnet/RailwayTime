//
//  Protocols.swift
//  RailwayTime
//
//  Created by Raj,Babul on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import Foundation
import UIKit

//MARK: COMMONVIEW

protocol CommonViewProtocol {
    func showMessage(message: String)
}

extension CommonViewProtocol where Self: UIViewController  {
    func showMessage(message: String)  {
        self.showAlert(message: message)
    }
}

//MARK: COMMON ROUTER

protocol CommonRouterProtocol {
    func showStationSearchView(view: CommonViewProtocol,resultDelegate: StationSearchResultProtocol)
}

// MARK:  FROMTOVIEW

protocol FromToViewProtocol {
    func didselectTextField(type: FromToTextFieldType)
}
