//
//  TrainStopsTableViewCell.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

class TrainStopsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var stopLabel: UILabel!
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var verticalLine: UIView!
    static let cellId = "trainStopCell"
    
    private func setLabelFont(type: TrainStopType) {
        switch type {
        case .current:
            stopLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            break
        case .next:
            stopLabel.text = "\(stopLabel.text ?? "Error") - Next Stop"
            stopLabel.font = UIFont.systemFont(ofSize: 17.0)
            break
        case .none:
            stopLabel.font = UIFont.systemFont(ofSize: 17.0)
            break
        }
    }
    
    func set(name: String, font: UIFont, color: UIColor) {
        circle.layer.cornerRadius = circle.frame.width/2
        stopLabel.text = name
        stopLabel.font = font
        circle.backgroundColor = color
    }
}
