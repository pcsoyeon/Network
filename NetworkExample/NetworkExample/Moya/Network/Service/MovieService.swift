//
//  MediaService.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

import Moya

enum MovieService {
    case trend(type: String, time: String)
    case similar(id: Int)
}

extension MovieService: BaseTargetType {
    var path: String {
        switch self {
        case .trend(let type, let time):
            return "/trending/\(type)/\(time)"
        case .similar(let id):
            return  "/movie/\(id)/similar"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .trend, .similar:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .trend, .similar:
            return .requestParameters(parameters: ["api_key": APIKey.KEY, "language" : "en-US"], encoding: URLEncoding.default)
        }
    }
}
