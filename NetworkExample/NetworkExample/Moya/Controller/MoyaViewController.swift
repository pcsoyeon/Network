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
        MoyaTrendAPI.shared.fetchSimilarMovieList { result in
            guard let result = result else { return }
            self.response = result.results
            
            self.rootView.tableView.reloadData()
        }
    }
}
