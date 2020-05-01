//
//  TableViewController.swift
//  PopoverDemo
//
//  Created by zhangwen on 2020/4/30.
//  Copyright © 2020 zhangwen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let text = (0...indexPath.row).reduce("") { $0 + "\($1)" }
        cell.textLabel?.text = "Item \(text)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }

     public override var preferredContentSize: CGSize {
         get {
             
            if let presentingViewController = presentingViewController {
                var size = presentingViewController.view.bounds.size
                size.width = 200
                size = tableView.sizeThatFits(size)
                return size
            }
            
            return super.preferredContentSize
         }

         set { super.preferredContentSize = newValue }
     }

}
