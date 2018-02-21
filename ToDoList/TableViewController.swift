//
//  ViewController.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 21/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let itemArray = ["Find Eggs", "Buy Eggs", "Destroy Eggs"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

   //MARK -- Tableview DataSourceMethod
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return itemArray.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
    
        return cell
    }
    
    //MARK-- Tableview DelegateMethod
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
}

