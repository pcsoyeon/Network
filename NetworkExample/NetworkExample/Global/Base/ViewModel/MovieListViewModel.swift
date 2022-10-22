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
    
    func requestMovieListToAlamo(completionHandler: ((NetworkResult<Any>) -> Void)?) {
        AlamofireTrendAPIManager.shared.fetchMovieList(type: "all", time: "week") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                guard let data = value as? [TrendMedia] else  { return }
                self.movieList.value = data
                print(self.movieList.value)
                
            case .requestErr(let result):
                print(result)
                
            case .serverErr:
                print("SEVER ERROR")
                
            default :
                print("ERROR")
            }
        }
    }
    
    func requestMovieListToMoya() {
        MoyaTrendAPI.shared.fetchSimilarMovieList { result in
            guard let result = result else { return }
            dump(result.results)
        }
    }
}
