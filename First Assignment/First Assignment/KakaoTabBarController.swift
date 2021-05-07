//
//  KakaoTabBarController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/04/23.
//

import UIKit

class KakaoTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor.black
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    private func setTabBar() {
        let friendStoryboard = UIStoryboard(name: "Friend", bundle: nil)
        let chatStoryboard = UIStoryboard(name: "Chat", bundle: nil)
        let hashStoryboard = UIStoryboard(name: "Hash", bundle: nil)
        let shoppingStoryboard = UIStoryboard(name: "Shopping", bundle: nil)
        let moreStoryboard = UIStoryboard(name: "More", bundle: nil)
        
        guard let friend = friendStoryboard.instantiateViewController(identifier: "FriendViewController") as? FriendViewController,
              let chat = chatStoryboard.instantiateViewController(identifier: "ChatViewController") as? ChatViewController,
              let hash = hashStoryboard.instantiateViewController(identifier: "HashViewController") as? HashViewController,
              let shopping = shoppingStoryboard.instantiateViewController(identifier: "ShoppingViewController") as? ShoppingViewController,
              let more = moreStoryboard.instantiateViewController(identifier: "MoreViewController") as? MoreViewController else {
            return
        }
        
        friend.tabBarItem.image = UIImage(named: "friendTabIcon")
        friend.tabBarItem.selectedImage = UIImage(named: "friendTabIconSelected")
        
        chat.tabBarItem.image = UIImage(named: "messageTabIcon")
        chat.tabBarItem.selectedImage = UIImage(named: "messageTabIconSelected")
        
        hash.tabBarItem.image = UIImage(named: "searchTabIcon")
        hash.tabBarItem.selectedImage = UIImage(named: "searchTabIconSelected")
        
        shopping.tabBarItem.image = UIImage(named: "shopTabIcon")
        shopping.tabBarItem.selectedImage = UIImage(named: "shopTabIconSelected")
        
        more.tabBarItem.image = UIImage(named: "detailTabIcon")
        more.tabBarItem.selectedImage = UIImage(named: "detailTabIconSelected")
        
        setViewControllers([friend,chat,hash,shopping,more], animated: true)
    }


}
