//
//  MovieAPI.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/28.
//

import Foundation

import Alamofire

final class MovieAPI {
    
    // 싱글톤
    static let shared = MovieAPI()
    
    private init() { }
    
    func fetchMovieList(type: String, time: String, completionHandler: @escaping (NetworkResult<Any>) -> Void) {
        // 어떤 request case를 사용할 것인지 선택 
        AF.request(MovieRouter.trend(type: type, time: time))
            .validate(statusCode: 200...500)
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    guard let value = dataResponse.value else { return }
                    
                    let networkResult = self.judgeStatus(by: statusCode, value)
                    completionHandler(networkResult)
                    
                case .failure:
                    completionHandler(.pathErr)
                }
            }
    }
    
    // 상태코드 분기처리
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        // decode 
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(TrendResponse.self, from: data) else { return .pathErr }
        
        switch statusCode {
        case 200:
            return .success(decodedData.results)
        case 400:
            return .requestErr("Bad Request")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}


