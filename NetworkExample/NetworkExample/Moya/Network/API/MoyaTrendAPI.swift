//
//  MoyaTrendAPI.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Moya

final class MoyaTrendAPI {
    static let shared: MoyaTrendAPI = MoyaTrendAPI()
    private let trendProvider = MoyaProvider<MovieService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var data: TrendResponse?
    
    func fetchSimilarMovieList(completion: @escaping (TrendResponse?) -> ()) {
        trendProvider.request(.trend(type: "all", time: "week")) { result in
            switch result {
            case .success(let response):
                do {
                    self.data = try response.map(TrendResponse?.self)
                    guard let data = self.data else { return }
                    completion(data)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
