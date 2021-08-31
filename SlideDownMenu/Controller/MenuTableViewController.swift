//
//  MenuTableViewController.swift
//  SlideDownMenu
//
//  Created by Adnann Muratovic on 31.08.21.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuItems = ["Home", "News", "Finance", "Tech", "Reviews", "Apple"]
    var currentItems = "Home"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell

        // Configure the cell...
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItems) ? UIColor.white : UIColor.gray
        return cell
    }
    
    // Selected Menu Item to update the title of navigation Bar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableViewController = segue.source as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            currentItems = menuItems[selectedIndexPath.row]
        }
    }
}
