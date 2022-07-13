//
//  FeedViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/6.
//

import UIKit

class FeedViewController: BaseViewController {
    var slideViewController: BaseViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContentViewController()
    }
    
    func loadContentViewController() {
        slideViewController = FeedSlideViewController()
        if let contentViewController = slideViewController {
            self.addChild(contentViewController)
            self.view.addSubview(contentViewController.view)
            contentViewController.didMove(toParent: self)
        }
    }
}
