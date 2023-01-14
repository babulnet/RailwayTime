//
//  BaseViewController.swift
//  RailwayTime
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, CommonViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getThemeColour()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
