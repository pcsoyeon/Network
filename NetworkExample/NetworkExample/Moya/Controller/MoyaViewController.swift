//
//  ViewController.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/15.
//

import UIKit

final class MoyaViewController: BaseViewController {
    
    // MARK: - Network
    
    override func fetchMovieList() {
        MoyaTrendAPI.shared.fetchTrendMovieListWithMoya(type: MediaType.all.rawValue, time: TimeType.week.rawValue) { [weak self] response in
            guard let self = self else { return }
            guard let response = response else { return }
            self.response = response.results
            
            self.rootView.tableView.reloadData()
        }
    }
    
    override func touchUpMovieListCell(_ indexPath: IndexPath) {
        MoyaSimilarAPI.shared.fetchSimilarMovieListWithMoya(id: self.response[indexPath.item].id) { response in
            guard let response = response else { return }
            
            dump(response.results)
        }
    }
}
