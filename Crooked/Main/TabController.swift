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
        let metaVC = MetaViewController()
        metaVC.tabBarItem.title = "M"
        self.addChild(metaVC)
        
        let discoverVC = DiscoverViewController()
        discoverVC.tabBarItem.title = "发现"
        self.addChild(discoverVC)
        
        let feedVC = FeedViewController()
        feedVC.tabBarItem.title = "feed"
        self.addChild(feedVC)
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem.title = "我"
        self.addChild(profileVC)
    }
}
