//
//  MediaService.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

import Moya

enum MovieService {
    case trend
    case similar(id: Int)
}

extension MovieService: BaseTargetType {
    var path: String {
        switch self {
        case .trend:
            return EndPoint.trend.requestURL
        case .similar(let id):
            return EndPoint.similar(id: id).requestURL
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
            return .requestPlain
        }
    }
}
