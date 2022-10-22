//
//  AlamofireViewController.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/15.
//

import UIKit

final class AlamofireViewController: BaseViewController {

    // MARK: - Network
    
    override func fetchMovieList() {
        AlamofireTrendAPIManager.shared.fetchMovieList(type: "all", time: "week") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let result):
                guard let data = result as? [TrendMedia] else  { return }
                self.response = data
                
                dump(self.response)
                
            case .requestErr(let result):
                print(result)
                
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
