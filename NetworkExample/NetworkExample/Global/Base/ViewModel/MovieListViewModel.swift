//
//  MovieListViewModel.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/22.
//

import Foundation

enum MovieType {
    case all
    case media
}

enum TimeType {
    case week
    case day
}

final class MovieListViewModel {
    
    var movieList: CObservable<[TrendMedia]> = CObservable([TrendMedia(posterPath: "", backdropPath: "", originalTitle: "", title: "", id: 0, releaseDate: "", voteAverage: 0.0, adult: false, overview: "", genre: [])])
    var similarList: CObservable<SimilarResponse> = CObservable(SimilarResponse(page: 0, results: [], totalPages: 0, totalResults: 0))
    
    // MARK: - Alamofire
    
    // request movie list
    func requestMovieListWithAlamo(completionHandler: ((NetworkResult<Any>) -> Void)?) {
        AlamofireTrendAPIManager.shared.fetchMovieList(type: "all", time: "week") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                guard let data = value as? [TrendMedia] else  { return }
                self.movieList.value = data
                
            case .requestErr(let result):
                print(result)
                
            case .serverErr:
                print("SEVER ERROR")
                
            default :
                print("ERROR")
            }
        }
    }
    
    // request similar movie list
    func requestSimilarMovieListWithAlamo(id: Int) {
        AlamofireSimilarAPIManager.shared.fetchSimilarMovieList(id: id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                guard let data = value as? SimilarResponse else  { return }
                self.similarList.value = data
                
            case .requestErr(let message):
                guard let message = message as? String else  { return }
                print(message)
                
            case .serverErr:
                print("SEVER ERROR")
                
            default :
                print("ERROR")
            }
        }
    }
    
    
    // MARK: - Moya
    
    func requestMovieListWithoya() {
        MoyaTrendAPI.shared.fetchSimilarMovieList { result in
            guard let result = result else { return }
            dump(result.results)
        }
    }
}
