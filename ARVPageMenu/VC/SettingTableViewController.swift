//
//  SettingTableViewController.swift
//  ARVPageMenu
//
//  Created by user1 on 04/04/19.
//  Copyright © 2019 samosys. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
     }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
    }

    
}
