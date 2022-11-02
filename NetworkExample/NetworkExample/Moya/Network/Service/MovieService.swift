//
//  MediaService.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

import Moya

// 영화 API에서 사용할 Service를 case 별로 관리
enum MovieService {
    // 트렌드 미디어 API
    case trend(type: String, time: String)
    
    // 비슷한 영화 API
    case similar(id: Int)
}

// TargetType이라는 protocol을 채택하면 -> 서버 통신 시 필요한 요소들을 채택해서 사용할 수 있도록 유도
extension MovieService: TargetType {
    // base url
    var baseURL: URL {
        return URL(string: URLConstant.BaseURL)!
    }
    
    // base url 뒤로 붙는 각 API 별 path parameter
    var path: String {
        switch self {
        case .trend(let type, let time):
            return "/trending/\(type)/\(time)"
        case .similar(let id):
            return  "/movie/\(id)/similar"
        }
    }
    
    // header
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    // method (.get, .post, .delete, .patch 등의 어떤 통신을 할 것인가?)
    var method: Moya.Method {
        switch self {
        case .trend, .similar:
            return .get
        }
    }
    
    // 서버를 연결하기 전, mock data
    var sampleData: Data {
        return Data()
    }
    
    // request를 어떻게 가공해서 보낼 것인가?
    // 1. request body로 보낼 것인가?
    // 2. query parameter로 보낼 것인가?
    // 3. JSON으로 보낼 것인가? 등등 .. 
    var task: Moya.Task {
        switch self {
        case .trend, .similar:
            return .requestParameters(parameters: ["api_key": APIKey.KEY, "language" : "en-US"], encoding: URLEncoding.default)
        }
    }
}
