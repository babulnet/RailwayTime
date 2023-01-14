//
//  ViewControllerExtension.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "Error", message: String, confirmCompletion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: confirmCompletion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension CommonViewProtocol where Self:UIViewController {
    func getThemeColour () {
        self.navigationController?.navigationBar.tintColor = Theme.colour
    }
}

