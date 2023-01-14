//
//  LiveTrainSearchViewController.swift
//  RailwayTime
//
//  Created by Babul Raj on 02/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

class LiveTrainSearchViewController: UIViewController,LiveModuleViewProtocol,FromToViewProtocol {
  
    
    @IBOutlet weak var searchLiveTrainButton: UIButton!
    @IBOutlet weak var fromToView: FromToView!
    var presenter: LiveModulePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        fromToView.delegate = self
        searchLiveTrainButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: LIVEVIEW MODULE PROTOCOL
    func updateFromAndToStations(fromStation: String?,toStation: String?) {
        fromToView.updateFromTextFields(fromStation: fromStation, toStation: toStation  )
    }
    
    // MARK: FROMTOVIEW PROTOCOL
    
    func didselectTextField(type: FromToTextFieldType) {
        presenter?.didSelectTextField(type: type)
    }
    
    @IBAction func searchLiveTrainsButtonTapped(_ sender: Any) {
        presenter?.showLiveTrains()
    }
}
