//
//  ViewController.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 21/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       loadItems()
    }
    
   //MARK -- Tableview DataSourceMethod
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return itemArray.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cell for row")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
// Terneary Operator------
// Value = condition ? vauleIFTrue : ValueIfFalse
// We can use below ternary operator
// cell.accessoryType = item.done ? .checkmark : .none
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    //MARK-- Tableview DelegateMethod
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
//Below command also we can use instead of below loop
//        itemArray[indexPath.row].done != itemArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        }else {
            itemArray[indexPath.row].done = false
        }
        
        saveItems()
        
        tableView.reloadData()
    }
    
    //MARK-- Add New Items
    
    @IBAction func barButtonpressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Items in To Do List", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user clicks add item on UIalert
            
            
            
            let newItem = Item()
           
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //Mark Encoding function for both title and status on or off
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }catch {
            print("Error encoding the data: \(error)")
        }
        self.tableView.reloadData()
    }
//    Decoding Function
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            }catch {
                print("Error encoding the data: \(error)")
            }
        }
    }
    
    
}

