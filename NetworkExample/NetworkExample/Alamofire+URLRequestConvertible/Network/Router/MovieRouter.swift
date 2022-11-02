//
//  MovieRouter.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/28.
//

import Foundation

import Alamofire

enum MovieRouter: URLRequestConvertible {
    case trend(type: String, time: String)
    case similar(id: Int)
}

extension MovieRouter {
    // Moya의 TargetType처럼 필요한 요소들을 관리
    // 1. baseURL
    var baseURL: URL {
        return URL(string: URLConstant.BaseURL)!
    }
    
    // 2. path parameter
    var path: String {
        switch self {
        case .trend(let type, let time):
            return "/trending/\(type)/\(time)"
        case .similar(let id):
            return  "/movie/\(id)/similar"
        }
    }
    
    // 3. header
    var headers: [String : String] {
        return ["Content-Type": "application/json"]
    }
    
    // 4. method
    var method: HTTPMethod {
        switch self {
        case .trend, .similar:
            return .get
        }
    }
    
    // 5. parameter (딕셔너리 형태로)
    var parameters: [String: String] {
        switch self {
        case .trend, .similar:
            return ["api_key": APIKey.KEY, "language" : "en-US"]
        }
    }
    
    // 위에서 case별로 1~5의 요소들을 request에 설정
    // 각 case에 맞는 request의 형태를 여기서 만들어주고 있다 !!!
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .trend, .similar:
            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        }
        
        // AF.(url ~~ -> 이 괄호 안의 요소들을 반환) 
        return request
    }
}
