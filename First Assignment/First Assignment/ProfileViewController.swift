//
//  ProfileViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var chattingStackView: UIStackView!
    @IBOutlet weak var edittingStackView: UIStackView!
    @IBOutlet weak var storyStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTapGesture()
        initializePanGesture()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        initializeTapGesture()
    }
    
    private func initializeTapGesture() {
        chattingStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchChattingStackView)))
        edittingStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchEdittingStackView)))
        storyStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchStoryStackView)))
    }
    
    private func initializePanGesture() {
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dragDownView(_:))))
    }
    
    @objc func dragDownView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        guard translation.y >= 0 else{
            return
        }
        self.view.frame.origin = CGPoint(x: 0, y: translation.y)
        
        if sender.state == .ended {
            let velocity = sender.velocity(in: self.view)
            
            if velocity.y >= 1330 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = CGPoint(x: 0, y: 0)
                }
            }
        }
        
    }
    
    @objc func touchChattingStackView() {
        print("chat")
    }
    
    @objc func touchEdittingStackView() {
        print("edit")
    }
    @objc func touchStoryStackView() {
        print("story")
    }
}
