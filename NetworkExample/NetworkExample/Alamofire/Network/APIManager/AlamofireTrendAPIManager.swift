//
//  AlamofireTrendAPIManger.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

import Alamofire

final class AlamofireTrendAPIManager {
    
    // 싱글톤 패턴으로 관리 
    static let shared = AlamofireTrendAPIManager()
    
    typealias completionHandler = (NetworkResult<Any>) -> Void
    
    private init() { }
    
    func fetchMovieList(type: String, time: String, completionHandler: @escaping completionHandler) {
        
        // MARK: -  Request
        // url
        let url = EndPoint.trend.requestURL + "/\(type)" + "/\(time)"
        
        // header
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        // parameter
        let params: Parameters = ["api_key" : "\(APIKey.KEY)",
                                  "language" : "en-US"]
        
        // request 상수
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: params,
                                     encoding: URLEncoding.default,
                                     headers: header)
        
        // MARK: -  Response
        
        // request 후 서버에서 전달 받은 response data 가공
        dataRequest.responseData { [weak self] dataResponse in
            guard let self = self else { return }
            
            // 응답 결과 분기처리
            switch dataResponse.result {
            case .success:
                // 성공했을 때
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completionHandler(networkResult)
                
            case .failure:
                // 실패했을 때
                completionHandler(.pathErr)
            }
        }
    }
    
    // 상태코드 분기처리 메서드
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        // 데이터 decode
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(TrendResponse.self, from: data) else { return .pathErr }
        
        // 상태코드에 따라서 다른 결과값 반환
        switch statusCode {
        case 200..<300:
            // 성공했다면, 데이터 전달
            return .success(decodedData.results)
        case 400..<500:
            // 잘못된 요청으로 실패했을 경우
            return .requestErr("Bad Request")
        case 500:
            // 서버 오류
            return .serverErr
        default:
            // 기타 네트워크 연결 등의 오류
            return .networkFail
        }
    }
}
