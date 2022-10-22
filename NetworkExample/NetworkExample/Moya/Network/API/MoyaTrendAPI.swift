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
    
    func fetchTrendMovieListWithMoya(type: String, time: String, completion: @escaping (TrendResponse?) -> ()) {
        trendProvider.request(.trend(type: type, time: time)) { result in
            switch result {
            case .success(let response):
                do {
                    self.data = try response.map(TrendResponse?.self)
                    guard let data = self.data else { return }
                    completion(data)
                } catch(let error) {
                    print(error.localizedDescription, 500)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
