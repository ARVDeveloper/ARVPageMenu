//
//  HomeVC.swift
//  ARVPlayer
//
//  Created by user1 on 04/04/19.
//  Copyright © 2019 samosys. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}
extension HomeVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Steve Jobs"
        cell.detailTextLabel?.text = "Hello, everyone"
        cell.imageView?.image = UIImage(named: "download")
        return cell
    }
    
    
}
