//
//  MoyaTrendAPI.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Moya

final class MoyaTrendAPI {
    
    // 싱글톤 패턴
    static let shared: MoyaTrendAPI = MoyaTrendAPI()
    
    // MoyaProvider라는 BaseProvider로 Provider를 구현하되, 조건(Target == API)에 따라 다양한 Provider를 생성해 구분된 네트워크 작업을 구현
    private let trendProvider = MoyaProvider<MovieService>(plugins: [MoyaLoggingPlugin()])
    
    private init() { }
    
    // 서버 연결 후 전달 받을 response
    public private(set) var data: TrendResponse?
    
    func fetchTrendMovieListWithMoya(type: String, time: String, completion: @escaping (TrendResponse?) -> ()) {
        // Alamofire에서 AF.request .. 했던 것처럼 위에서 만들어준 provider를 통해서 통신 시작
        // provider는 enum으로 관리한 service의 모음집이라고 생각할 수 있다. -> 여기서 어떤 케이스를 provider로 선택해서 통신할 것인지 선택
        trendProvider.request(.trend(type: type, time: time)) { result in
            switch result {
            case .success(let response):
                // 성공했을 경우
                do {
                    // 데이터가 잘 들어오고, decode도 잘 된다면
                    self.data = try response.map(TrendResponse?.self)
                    guard let data = self.data else { return }
                    
                    // 해당 데이터를 함수 호출 뒤, 탈출 클로저로 쓸 수 있도록 전달
                    completion(data)
                } catch(let error) {
                    // decode가 실패했다면
                    print(error.localizedDescription)
                }
            case .failure(let error):
                // 실패했을 경우
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
