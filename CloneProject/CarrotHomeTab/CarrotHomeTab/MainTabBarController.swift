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
        delegate = self
    }
    
    private func updateNavigationItem(vc: UIViewController) {
        
    }

}

// 각 탭에 맞게 네비게이션 바 아이템 구성
// 홈 : 타이틀, 피드, 서치 - 완료
// 동네활동 : 타이틀, 피드
// 내근처 : 타이틀
// 채팅 : 타이틀, 피드
// 나의 당근 : 타이틀, 설정


extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        switch viewController {
        case is HomeViewController:
            
            let titleConfig = CustomBarItemConfiguration(
                title: "이의동",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            
            let searchConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "magnifyingglass"),
                handler: { print("---> search tapped") }
            )
            let searchItem = UIBarButtonItem.generate(with: searchConfig, width: 30)
        
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("---> feed tapped") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem, searchItem]
            
        case is MyTownViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "이의동",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
        
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("---> feed tapped") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItem = feedItem
        case is ChatViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "채팅",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            let feedConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "bell"),
                handler: { print("---> bell tapped") }
            )
            let feedItem = UIBarButtonItem.generate(with: feedConfig, width: 30)
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [feedItem]
        case is MyProfileViewController:
            let titleConfig = CustomBarItemConfiguration(
                title: "나의 당근",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
            
            
            let settingConfig = CustomBarItemConfiguration(
                image: UIImage(systemName: "gearshape"),
                handler: { print("---> setting tapped") }
            )
            let settingItem = UIBarButtonItem.generate(with: settingConfig, width: 30)
        
            
            navigationItem.leftBarButtonItem = titleItem
            navigationItem.rightBarButtonItems = [settingItem]
        default:
            let titleConfig = CustomBarItemConfiguration(
                title: "이의동",
                handler: { }
            )
            let titleItem = UIBarButtonItem.generate(with: titleConfig)
        
            navigationItem.leftBarButtonItem = titleItem
            
        }
    }
}
