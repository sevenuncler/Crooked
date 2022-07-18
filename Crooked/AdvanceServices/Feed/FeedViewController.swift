//
//  FeedViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/6.
//

import UIKit
import SnapKit

class FeedViewController: BaseViewController {
    var slideViewController: BaseViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContentViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
    }
    
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
    }
    
    func loadContentViewController() {
        slideViewController = FeedSlideViewController()
        if let contentViewController = slideViewController {
            self.addChild(contentViewController)
            self.view.addSubview(contentViewController.view)
            contentViewController.view.snp.makeConstraints { make in
                make.edges.equalTo(self.view)
            }
            contentViewController.didMove(toParent: self)
        }
    }
}
