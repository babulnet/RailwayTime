//
//  TrainListTableViewCell.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//
import UIKit

class TrainListTableViewCell: UITableViewCell {

    static let cellId = "trainCell"
    
    @IBOutlet private weak var trainTypeLabel: UILabel!
    @IBOutlet private weak var originLabel: UILabel!
    @IBOutlet private weak var destinationLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var comingIn: UILabel!
    
    func set(name: String, origin: String, destination: String, status: String, dueIn: String) {
        trainTypeLabel.text = name
        originLabel.text = origin
        destinationLabel.text = destination
        statusLabel.text = status
        comingIn.text = dueIn
    }
}
