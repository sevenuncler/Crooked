//
//  ContentViewController.swift
//  Crooked
//
//  Created by fanghe on 2022/7/18.
//

import UIKit

class FeedContentViewController: BaseViewController, FeedContentViewControllerProtocol  {
    
    func prepareForReuse() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }


    
    func setup() {
        let viewPlayViewController = VideoPlayViewController()
        self.addChild(viewPlayViewController)
        self.view.addSubview(viewPlayViewController.view)
        viewPlayViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        viewPlayViewController.didMove(toParent: self)
        
        let interactionViewController = InteractionViewController()
        self.addChild(interactionViewController)
        self.view.addSubview(interactionViewController.view)
        interactionViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        interactionViewController.didMove(toParent: self)
        
    }
}
