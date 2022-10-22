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
        MoyaTrendAPI.shared.fetchSimilarMovieList { [weak self] result in
            guard let self = self else { return }
            guard let result = result else { return }
            
            self.response = result.results
            dump(self.response)
        }
    }
}
