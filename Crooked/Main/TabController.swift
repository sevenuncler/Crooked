//
//  TabController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/6.
//

import UIKit

class TabController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.color(named: .Background)
        
        let metaVC = BaseNavigationController.init(rootViewController: MetaViewController())
        metaVC.tabBarItem.title = "tab_title_m".localized()
        self.addChild(metaVC)
        
        let discoverVC = BaseNavigationController.init(rootViewController: DiscoverViewController())
        discoverVC.tabBarItem.title = "tab_title_discover".localized()
        discoverVC.view.backgroundColor = Color.color(named: .P1)
        self.addChild(discoverVC)
        
        let feedVC = BaseNavigationController.init(rootViewController: FeedViewController())
        feedVC.tabBarItem.title = "tab_title_feed".localized()
        feedVC.view.backgroundColor = Color.color(named: .P2)
        self.addChild(feedVC)
        
        let profileVC = BaseNavigationController.init(rootViewController: ProfileViewController())
        profileVC.view.backgroundColor = Color.color(named: .P3)
        profileVC.tabBarItem.title = "tab_title_me".localized()
        self.addChild(profileVC)
    }
}
