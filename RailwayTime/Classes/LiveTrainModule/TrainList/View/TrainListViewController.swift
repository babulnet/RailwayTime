//
//  TrainListViewController.swift
//  RailwayTime
//
//  Created by Babul Raj on 05/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

class TrainListViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var noResultsLabel: UILabel!

    var refreshControl : UIRefreshControl?
    var presenter: TrainListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupTableView()
        presenter?.getTrainList()
    }

    // MARK: - View Setup

    private func setupNavigationItems() {
        if let presenter = presenter, let station = presenter.station {
            title = "Trains passing \(station.name)"
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(TrainListViewController.refreshData))
    }

    private func setupTableView() {
        noResultsLabel.isHidden = true

        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "TrainListTableViewCell", bundle: nil),
                           forCellReuseIdentifier: TrainListTableViewCell.cellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 125.0
        
        activityIndicator.startAnimating()
    }


    @objc func refreshData() {
        activityIndicator.startAnimating()
        presenter?.trainList = []
        presenter?.getTrainList()
        tableView.reloadData()
    }
}

extension TrainListViewController: TrainListViewProtocol {
    func showTrainList() {
        activityIndicator.stopAnimating()

        if let presenter = presenter {
            noResultsLabel.isHidden = !(presenter.trainList.count == 0)
        }

        tableView.reloadData()
    }

    func showError(_ message: String) {
        activityIndicator.stopAnimating()
        showAlert(message: message)
    }
}

extension TrainListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainListTableViewCell.cellId,
                                                 for: indexPath) as! TrainListTableViewCell
        cell.selectionStyle = .none
        
        if let presenter = presenter {
            let cellInfo = presenter.getCellInfo(index: indexPath.row)
            cell.set(name: cellInfo.name, origin: cellInfo.origin, destination: cellInfo.destination, status: cellInfo.status, dueIn: cellInfo.dueIn)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.trainList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTrainDetails(indexPath.row)
    }
    
}
