//
//  FeedSlideViewCell.swift
//  Crooked
//
//  Created by fanghe on 2022/7/13.
//

import UIKit

class FeedSlideViewCell: UITableViewCell {
    var contentViewController: (UIViewController & FeedContentViewControllerProtocol)?
    
    func addContentViewController(containerViewController: UIViewController, contentViewController: (UIViewController & FeedContentViewControllerProtocol)) {
        if self.contentViewController != nil {
            self.contentViewController?.willMove(toParent: nil)
            self.contentViewController?.view.removeFromSuperview()
            self.contentViewController?.removeFromParent()
            self.contentViewController = nil
        }
        
        self.contentViewController = contentViewController
        containerViewController.addChild(contentViewController)
        self.contentView.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: containerViewController)
    }
    
}
