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
        let metaVC = MetaViewController()
        metaVC.tabBarItem.title = "M"
        self.addChild(metaVC)
        
        let discoverVC = DiscoverViewController()
        discoverVC.tabBarItem.title = "发现"
        discoverVC.view.backgroundColor = Color.color(named: .P1)
        self.addChild(discoverVC)
        
        let feedVC = FeedViewController()
        feedVC.tabBarItem.title = "feed"
        feedVC.view.backgroundColor = Color.color(named: .P2)
        self.addChild(feedVC)
        
        let profileVC = ProfileViewController()
        profileVC.view.backgroundColor = Color.color(named: .P3)
        profileVC.tabBarItem.title = "我"
        self.addChild(profileVC)
    }
}
