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
        AlamofireTrendAPIManger.shared.fetchMovieList(type: "all", time: "week") { result in
            switch result {
            case .success(let result):
                dump(result)
                
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
