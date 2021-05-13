//
//  NetworkResult.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
