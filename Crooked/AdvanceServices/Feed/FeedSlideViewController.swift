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
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        bind()
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
        cell.backgroundColor = Color.randomColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.size.height
    }
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: .plain)
        tableView.register(FeedSlideViewCell.self, forCellReuseIdentifier: "FeedSlideViewCell")
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
}
