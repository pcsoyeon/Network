//
//  Base.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: URLConstant.BaseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
