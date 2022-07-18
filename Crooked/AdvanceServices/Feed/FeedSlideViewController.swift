//
//  FeedSlideViewController.swift
//  Crooked
//
//  Created by fanghe on 2022/7/13.
//

import UIKit
import SnapKit

class FeedSlideViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        bind()
        self.tableView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
    }
    
    func bind() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedSlideViewCell", for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = Color.randomColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 843
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView.register(FeedSlideViewCell.self, forCellReuseIdentifier: "FeedSlideViewCell")
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0.1))
        tableView.tableFooterView = UIView.init()
        return tableView
    }()
}
