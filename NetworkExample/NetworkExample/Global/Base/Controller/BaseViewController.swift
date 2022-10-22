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
    
    var dataSource: UICollectionViewDiffableDataSource<Int, TrendMedia>!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        bindData()
    }
    
    // MARK: - CollectionView
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<MovieListCollectionViewCell, TrendMedia> { cell, indexPath, itemIdentifier in
            cell.setData(itemIdentifier)
        }
            
        dataSource = UICollectionViewDiffableDataSource(collectionView: rootView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    // MARK: - Data
    
    func bindData() {

    }
    
    // MARK: - Custom Method
    
    func makeAlert(title : String,
                           message : String,
                           okAction : ((UIAlertAction) -> Void)? = nil,
                           completion : (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
