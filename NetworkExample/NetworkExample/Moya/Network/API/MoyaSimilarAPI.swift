//
//  MoyaSimilarAPI.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/22.
//

import Foundation

import Moya

final class MoyaSimilarAPI {
    
    static let shared: MoyaSimilarAPI = MoyaSimilarAPI()
    
    private let similarProvider = MoyaProvider<MovieService>(plugins: [MoyaLoggingPlugin()])
    
    private init() { }
    
    public private(set) var data: SimilarResponse?
    
    func fetchSimilarMovieListWithMoya(id: Int, completion: @escaping(SimilarResponse?) -> ()) {
        similarProvider.request(.similar(id: id)) { result in
            switch result {
            case .success(let response):
                do {
                    self.data = try response.map(SimilarResponse?.self)
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
