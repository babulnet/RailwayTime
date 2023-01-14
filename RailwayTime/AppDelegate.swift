//
//  AppDelegate.swift
//  RailwayTime
//
//  Created by Babul Raj on 02/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let tab = window?.rootViewController as? TabBarController {
            for nav in tab.childViewControllers {
                for child in nav.childViewControllers {
                    self.injectDependancies(viewController: child)
                }
            }
        }
        return true
    }
    
    func injectDependancies(viewController: UIViewController) {
        if viewController is LiveTrainSearchViewController {
            if let aVc = viewController as? LiveTrainSearchViewController {
                let liveVcPresenter = LiveTrainVCPresenter()
                let aView: UIViewController & LiveModuleViewProtocol = aVc
                liveVcPresenter.view = aView
                liveVcPresenter.searchStationWireframe = CommonWireFrame()
                liveVcPresenter.wireFrame = LiveTrainSearchWireframe()
                
                let liveVcInteractor = LiveTrainVCInteractor()
                liveVcInteractor.presenter = liveVcPresenter
                aVc.presenter = liveVcPresenter
            }
        } else if viewController is TrainSeachViewController {
            
        }
    }
}

