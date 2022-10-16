//
//  URLConstant.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

extension URL {
    static func makeEndPointString(_ endPoint: String) -> String {
        return URLConstant.BaseURL + endPoint
    }
}

enum EndPoint {
    case trend
    case similar(id: Int)
    
    var requestURL: String {
        switch self {
        case .trend:
            return URL.makeEndPointString("/trending")
        case .similar(let id):
            return URL.makeEndPointString("/movie/\(id)/similar")
        }
    }
}

