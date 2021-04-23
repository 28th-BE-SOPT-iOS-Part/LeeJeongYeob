//
//  FriendViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/23.
//

import UIKit

class FriendViewController: UIViewController {

    @IBOutlet weak var menuTabBar: UITabBar!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTabBar.selectedItem = menuTabBar.items?[0]
        initializeTapGesture()
    }
    
    private func initializeTapGesture() {
        self.profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchProfileImage)))
    }
    
    @objc func touchProfileImage() {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {
            return
        }
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
        
    }

}
extension FriendViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ProfileModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
