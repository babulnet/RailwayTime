//
//  StationSearchPresenterTest.swift
//  RailwayTimeTests
//
//  Created by Raj,Babul on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import XCTest
@testable import RailwayTime


class StationSearchPresenterTest: XCTestCase {

    var stationSearchPresenter = StationSearchPresenter()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stationSearchPresenter = StationSearchPresenter()
        stationSearchPresenter.view = MockView()
        stationSearchPresenter.interactor = MockInteractor()
        stationSearchPresenter.wireFrame = MockWireFrame()
    }
    
    func testFilerStationArray() {
    }
}

    
class MockView: StationSearchViewProtocol {
    var presenter: StationSearchPresenterProtocol?
    var showStationListCalled = false
    var showErrorCalled = false
    
    func showStationList() {
        showStationListCalled = true
    }
    
    func showError(_ message: String) {
        showErrorCalled = true
    }
}
class MockInteractor: StationSearchPresenterToInteractor {
    var presenter: StationSearchInteractorToPresenter?
    var fetchStationListCalled = false
    
    func fetchStationList() {
        fetchStationListCalled = true
    }
}
    
class MockWireFrame: StationSearchWireframeProtocol {
    static var createStationSearchViewCalled = false
    var popTrainSeachViewCalled = false
   
    static func createStationSearchView(view: CommonViewProtocol, resultDelegate: StationSearchResultProtocol) -> UIViewController {
        createStationSearchViewCalled = true
    }
    
    func popTrainSeachView(view: StationSearchViewProtocol) {
         popTrainSeachViewCalled = true
    }
}
