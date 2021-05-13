//
//  loginModel.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/14.
//

import Foundation

// MARK: - Welcome
struct Signin: Codable {
    let userId: Int
    let userNickname: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "UserId"
        case userNickname = "user_nickname"
        case token = "token"
    }
}
