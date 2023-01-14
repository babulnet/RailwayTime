//
//  StationSearchViewController.swift
//  RailwayTime
//
//  Created by Raj,Babul on 04/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

class StationSearchViewController: BaseViewController,StationSearchViewProtocol  {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    var presenter: StationSearchPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchedCountry = [String]()
    var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getStationList()
        activityIndicatorView.startAnimating()
    }
    
    func showStationList() {
        activityIndicatorView.stopAnimating()
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        activityIndicatorView.stopAnimating()
        self.showAlert(message: message)
    }
}

extension StationSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let stationName = presenter?.getStationName(index: indexPath.row)
        cell?.textLabel?.text = stationName
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.text = presenter?.getStationName(index: indexPath.row)
        presenter?.didSelectStation(index: indexPath.row)
        presenter?.didEndSearch()
    }
}

extension StationSearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.isSearchOn = true
        presenter?.filerStationArray(text: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.isSearchOn  = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didEndSearch()
    }
}
