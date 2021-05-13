//
//  AccountAPI.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/14.
//

import Foundation
import Alamofire

struct AccountAPI {
    static let shared = AccountAPI()
    
    func postSignInData(_ email: String, _ password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = API.signin
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let param = ["email" : email,
                     "password": password]
        
        let dataRequest = AF.request(URL,
                                     method: .post,
                                     parameters: param,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {
                    return
                }
                guard let value = dataResponse.value else {
                    return
                }
                let networkResult = self.judgeSigninStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.pathErr)
            }
        }
    }
    
    private func judgeSigninStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(AccountModel<Signin>.self, from: data) else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
    func postSignupData(_ email: String, _ password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = API.signin
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let param = ["email" : email,
                     "password": password,
                      "sex" : "0",
                      "nickname" : "sopt_test",
                      "phone" : "010-1010-2020",
                      "birth" : "1996-02-24"]
        
        let dataRequest = AF.request(URL,
                                     method: .post,
                                     parameters: param,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {
                    return
                }
                guard let value = dataResponse.value else {
                    return
                }
                let networkResult = self.judgeSignupStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.pathErr)
            }
        }
    }
    
    private func judgeSignupStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(AccountModel<Signup>.self, from: data) else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
