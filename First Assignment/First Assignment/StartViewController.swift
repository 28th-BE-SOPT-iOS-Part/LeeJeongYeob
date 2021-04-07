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
            guard let vc = storyboard?.instantiateViewController(identifier: "ConfirmViewController") as? ConfirmViewController, let id = idTextField.text else {
                return
            }
            vc.name = id
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
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
}