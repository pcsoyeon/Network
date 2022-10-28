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
    var baseURL: URL {
        return URL(string: URLConstant.BaseURL)!
    }
    
    var path: String {
        switch self {
        case .trend(let type, let time):
            return "/trending/\(type)/\(time)"
        case .similar(let id):
            return  "/movie/\(id)/similar"
        }
    }
    
    var headers: [String : String] {
        return ["Content-Type": "application/json"]
    }
    
    var method: HTTPMethod {
        switch self {
        case .trend, .similar:
            return .get
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .trend, .similar:
            return ["api_key": APIKey.KEY, "language" : "en-US"]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .trend, .similar:
            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}
