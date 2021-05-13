//
//  StartViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/06.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func touchLogin(_ sender: Any) {
        if checkTextField() {
            guard let email = idTextField.text, let password = passwordTextField.text else {
                return
            }
        
            AccountAPI.shared.postSignInData(email, password) { result in
                switch result {
                case .success(let data):
                    if let data = data as? Signin {
                        UserDefaults.standard.set(data.token, forKey: "token")
                        self.makeAlert(title: "알림", message: "로그인 성공 ^o^", okAction: self.pushToTabbarController(_:), completion: nil)
                    }
                case .requestErr(let message):
                    if let message = message as? String {
                        self.makeAlert(title: "알림", message: message, okAction: nil, completion: nil)
                    }
                default:
                    print("Error")
                }
                
            }
            
            
            
            
        }
        
    }
    
    @IBAction func touchSignUp(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func checkTextField() -> Bool {
        guard let id = idTextField.text, let password = passwordTextField.text else {
            return false
        }
        if !(id.isEmpty || password.isEmpty) {
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
