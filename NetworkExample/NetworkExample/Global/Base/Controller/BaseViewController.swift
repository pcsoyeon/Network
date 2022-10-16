//
//  BaseViewController.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - UI Property
    
    let rootView = MovieListView()
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    // MARK: - Property
    
    var response: [TrendMedia] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchMovieList()
    }
    
    private func configureUI() {
        setTableView()
    }
    
    private func setTableView() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        
        rootView.tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.identifier)
    }
    
    // MARK: - Network
    
    func fetchMovieList() {
        
    }
}

// MARK: - UITableView Protocol

extension BaseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension BaseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.identifier, for: indexPath) as? MovieListTableViewCell else { return UITableViewCell() }
        cell.setData(response[indexPath.row])
        return cell
    }
}
