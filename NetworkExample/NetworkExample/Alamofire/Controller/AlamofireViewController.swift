//
//  AlamofireViewController.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/15.
//

import UIKit

final class AlamofireViewController: BaseViewController {

    // MARK: - Network
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    // 함수 실행 후 영화 목록 리스트 fetch 후 UI 업데이트
    override func fetchMovieList() {
        AlamofireTrendAPIManager.shared.fetchMovieList(type: MediaType.all.rawValue, time: TimeType.week.rawValue) { [weak self] result in
            guard let self = self else { return }
            
            // 네트워크 결과 분기처리
            switch result {
            case .success(let result):
                // 전달받은 결과를 필요한 형태로 만들고
                guard let data = result as? [TrendMedia] else  { return }
                // 필요한 데이터만 뽑아서
                self.response = data
                // TableView Reload
                self.rootView.tableView.reloadData()
                
            case .serverErr:
                // 만약, 서버 에러라고 전달이 된다면
                // 클라이언트에서 처리하는 것이 아니라, 서버가 수정되면 클라이언트에서 같은 요청을 보냈을 때 해결이 될 수 있으므로 alert창 present
                self.makeAlert(title: "알림", message: "서버 오류입니다. 잠시 후 다시 시도해주세요 :(")
                
            default :
                print("ERROR")
            }
        }
    }
    
    // 위의 fetch 함수와 비슷한 로직
    // UI 업데이트 X, dump로만 확인 가능 
    override func touchUpMovieListCell(_ indexPath: IndexPath) {
        AlamofireSimilarAPIManager.shared.fetchSimilarMovieList(id: self.response[indexPath.row].id) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let result):
                guard let response = result as? [SimilarMovie] else  { return }
                dump(response)
                
            case .serverErr:
                self.makeAlert(title: "알림", message: "서버 오류입니다. 잠시 후 다시 시도해주세요 :(")
                
            default :
                print("ERROR")
            }
        }
    }
    
    // MARK: - Custom Method
    
    private func makeAlert(title : String,
                           message : String,
                           okAction : ((UIAlertAction) -> Void)? = nil,
                           completion : (() -> Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
