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
        guard let vc = storyboard?.instantiateViewController(identifier: "ConfirmViewController") as? ConfirmViewController, let id = idTextField.text else {
            return
        }
        vc.name = id
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
            self.navigationController?.popViewController(animated: true)
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
}
