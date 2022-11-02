//
//  AlamofireSimilarAPIManager.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

import Alamofire

final class AlamofireSimilarAPIManager {
    
    static let shared = AlamofireSimilarAPIManager()
    
    typealias completionHandler = (NetworkResult<Any>) -> Void
    
    private init() { }
    
    func fetchSimilarMovieList(id: Int, page: Int = 1, completionHandler: @escaping (NetworkResult<Any>) -> Void) {
        let url = EndPoint.similar(id: id).requestURL +  "?api_key=\(APIKey.KEY)&page=\(page)"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let params: Parameters = ["api_key" : "\(APIKey.KEY)",
                                  "language" : "en-US"]
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: params,
                                     encoding: URLEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { [weak self] dataResponse in
            guard let self = self else { return }
            
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
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(TrendResponse.self, from: data) else { return .pathErr }
        
        switch statusCode {
        case 200..<300:
            return .success(decodedData.results)
        case 400..<500:
            return .requestErr("Bad Request")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
