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
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        
    }
    
    // MARK: - Network
    
    func fetchMovieList() {
        
    }
}
