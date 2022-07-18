//
//  FeedContentViewControllerProtocol.swift
//  Crooked
//
//  Created by fanghe on 2022/7/18.
//

import UIKit

protocol FeedContentViewControllerProtocol {
    func prepareForReuse();
}

class FeedContentFactory {
    static let shared = FeedContentFactory()
    func feedContentViewController() -> (UIViewController & FeedContentViewControllerProtocol) {
        return FeedContentViewController()
    }
}
