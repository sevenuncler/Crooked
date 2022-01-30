//
//  NearestTableViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/5.
//

import UIKit

class NearestTableViewController: UITableViewController {
    let dataContoller: AnchorListDataController?
    
    lazy var viewModel: NearestViewModel = {
        if let controller = dataContoller {
            return NearestViewModel(dataController: controller)
        } else {
            return NearestViewModel(dataController: AnchorListDataController())
        }
    } ()
    
    
    init(dataController: AnchorListDataController) {
        self.dataContoller = dataController;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        dataContoller?.registerBlock(handler: { type, list in
            self.tableView .reloadData()
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshIfNeeded()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if dataContoller != nil {
            return dataContoller!.allAnnotations?.count ?? 0
        } else {
            return 0;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataContoller!.allAnnotations?[indexPath.row]
        var cell: NearestBaseCell? = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(NearestBaseCell.self)) as! NearestBaseCell
        if cell == nil {
            cell = NearestBaseCell()
        }
        
        // Configure the cell...
        if model != nil {
            cell!.refresh(model: model)
        }
        
        return cell!
    }
    
    // MARK: - Internal
    func setupUI() {
        self.tableView.register(NearestBaseCell.self, forCellReuseIdentifier: NSStringFromClass(NearestBaseCell.self))
    }
    
    func refreshIfNeeded() {
        viewModel.fetchAnchors { success, anchors in
            if success == true {
                self.tableView.reloadData()
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
