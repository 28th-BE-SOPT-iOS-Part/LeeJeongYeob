//
//  ConfirmViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/06.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLabel()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchConfirmButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func initializeLabel() {
        welcomeLabel.text = name+"님\n환영합니다"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
