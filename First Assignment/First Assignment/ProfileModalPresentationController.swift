//
//  ProfileModalPresentationController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/23.
//

import UIKit

class ProfileModalPresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super .init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = containerView!.frame
    }
    
}
