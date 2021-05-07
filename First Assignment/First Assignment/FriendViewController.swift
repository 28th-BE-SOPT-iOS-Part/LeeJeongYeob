//
//  FriendViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/23.
//

import UIKit

class FriendViewController: UIViewController {

    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    private var friendList: [FriendDataModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setFriendList()
        initializeTapGesture()
        registerDelegateDatasource()
        registerTableViewCell()
    }
    
    private func setFriendList() {
        friendList.append(contentsOf: [
                    FriendDataModel(imageName: "profileImage1",
                                    name: "안솝트",
                                    state: "배고파요"),
                    
                    FriendDataModel(imageName: "profileImage2",
                                    name: "최솝트",
                                    state: "피곤해요"),
                    
                    FriendDataModel(imageName: "profileImage3",
                                    name: "정솝트",
                                    state: "시험언제끝나죠?"),
                    
                    FriendDataModel(imageName: "profileImage4",
                                    name: "이솝트",
                                    state: "ㅠㅠㅠㅠ"),
                    
                    FriendDataModel(imageName: "profileImage5",
                                    name: "유솝트",
                                    state: "나는 상태메세지!"),
                    
                    FriendDataModel(imageName: "profileImage6",
                                    name: "박솝트",
                                    state: "원하는대로 바꿔보세요 ^_^"),
                    
                    FriendDataModel(imageName: "profileImage7",
                                    name: "최솝트",
                                    state: "넘 덥다.."),
                    
                    FriendDataModel(imageName: "profileImage8",
                                    name: "원솝트",
                                    state: "배고파요"),
                    
                    FriendDataModel(imageName: "profileImage9",
                                    name: "투솝트",
                                    state: "내꿈은 대나무부자"),
                    
                    FriendDataModel(imageName: "profileImage10",
                                    name: "권솝트",
                                    state: "걱정말라구!")
                    
                    
                    
                ])
        
    }
    
    private func registerDelegateDatasource() {
        self.friendTableView.delegate = self
        self.friendTableView.dataSource = self
        self.friendTableView.separatorStyle = .none
    }
    
    private func registerTableViewCell() {
        friendTableView.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendTableViewCell")
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

extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension FriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
         return 5
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell else {
            return UITableViewCell()
        }
        cell.initializeData(self.friendList[indexPath.row].image, self.friendList[indexPath.row].name, self.friendList[indexPath.row].state)
        return cell
    }
    
    
}


extension FriendViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ProfileModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
