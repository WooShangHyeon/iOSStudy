//
//  MainTabBarController.swift
//  CarrotHomeTab
//
//  Created by 우상현 on 10/25/23.
//

import UIKit

// 탭이 눌릴때 그에 맞는 네비게이션 바를 구성
// - 탭이 눌리는 것을 감지
// - 감지 후 그 탭에 맞는 네비게이션 바를 구성 업데이트

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "hello", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        
        delegate = self
        
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
        print("--> \(viewController)")
        
        switch viewController {
        case is HomeViewController:
            let titleItem = UIBarButtonItem(title: "hello", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        case is MyTownViewController:
            let titleItem = UIBarButtonItem(title: "이의동", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        case is ChatViewController:
            let titleItem = UIBarButtonItem(title: "채팅", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        case is MyProfileViewController:
            let titleItem = UIBarButtonItem(title: "나의당근", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        default:
            let titleItem = UIBarButtonItem(title: "우상현", style: .plain, target: nil, action: nil)
            let feedItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        }
    }
}
