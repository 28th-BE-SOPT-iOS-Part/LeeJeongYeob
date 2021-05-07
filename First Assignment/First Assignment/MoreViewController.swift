//
//  SettingViewController.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/07.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var iconCollectionView: UICollectionView!
    
    var text: [String] = ["메일",
    "캘린더",
    "서랍",
    "카카오콘",
    "메이커스",
    "선물하기",
    "이모티콘",
    "프렌즈",
    "쇼핑하기",
    "스타일",
    "주문하기",
    "멜론티켓",
    "게임",
    "멜론",
    "헤어샵",
    "전체서비스"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDelegateDatasource()
        registerCell()

    }
    
    private func registerDelegateDatasource() {
        iconCollectionView.delegate = self
        iconCollectionView.dataSource = self
    }
    
    private func registerCell() {
        iconCollectionView.register(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IconCollectionViewCell")
    }
}

extension MoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as?
                IconCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.initializeValue(text[indexPath.item])
        return cell
    }
    
    
}
