//
//  NetworkResult.swift
//  NetworkExample
//
//  Created by 소연 on 2022/10/16.
//

import Foundation

@frozen
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
