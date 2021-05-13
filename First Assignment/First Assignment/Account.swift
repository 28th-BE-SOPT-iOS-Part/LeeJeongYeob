//
//  Account.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/14.
//

import Foundation

struct AccountModel<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: T?
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
