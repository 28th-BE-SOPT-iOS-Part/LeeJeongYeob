//
//  SignUpViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/06.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchCreateButton(_ sender: Any) {
        if checkTextField() {
            guard let email = idTextField.text, let password = pwTextField.text else {
                return
            }
        
            AccountAPI.shared.postSignupData(email, password) { result in
                switch result {
                case .success(let message):
                    if let message = message as? String {
                        self.makeAlert(title: "알림", message: message, okAction: self.pushToTabbarController(_:), completion: nil)
                    }
                case .requestErr(let message):
                    if let message = message as? String {
                        self.makeAlert(title: "알림", message: message, okAction: nil, completion: nil)
                    }
                default:
                    print("Error")
                }
                
            }
            
        } else {
            self.makeAlert(title: "알림", message: "필요한 값이 존재하지 않습니다", okAction: nil, completion: nil)
        }
        
        
    }
    private func checkTextField() -> Bool {
        guard let id = idTextField.text, let pw = pwTextField.text, let checkPw = pwCheckTextField.text else {
            return false
        }
        
        if !(id.isEmpty || pw.isEmpty || checkPw.isEmpty) {
            return true
        }
        return false
    }
    
    func pushToTabbarController(_ action :UIAlertAction) {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "KakaoTabBarController") as? KakaoTabBarController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
