//
//  AlamofireViewController.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/15.
//

import UIKit

final class AlamofireViewController: BaseViewController {
    
    // MARK: - Property
    
    private var viewModel = MovieListViewModel()
    
    // MARK: - UI Method
    
    override func configureCollectionView() {
        rootView.collectionView.delegate = self
    }

    // MARK: - Network
    
    override func bindData() {
        viewModel.requestMovieListWithAlamo { [weak self] networkResult in
            guard let self = self else { return }
            
            switch networkResult {
            case .success:
                print("success")
            case .pathErr, .requestErr, .networkFail:
                print("error")
            case .serverErr:
                self.makeAlert(title: "서버 오류", message: "잠시 후 다시 시도해주세요 :(")
            }
        }
        
        viewModel.movieList.bind { lists in
            var snapshot = NSDiffableDataSourceSnapshot<Int, TrendMedia>()
            
            snapshot.appendSections([0])
            snapshot.appendItems(lists)
            
            self.dataSource.apply(snapshot)
        }
        
        viewModel.similarList.bind { response in
            dump(response.results)
        }
    }
}

// MARK: - UICollectionView Delegate

extension AlamofireViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = viewModel.movieList.value[indexPath.item].id
        viewModel.requestSimilarMovieListWithAlamo(id: id)
    }
}

