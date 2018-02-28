//
//  CategoryViewController.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 27/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
      loadCategories()
        print(categoryArray)
    }
    
    //MARK :- TableView DataSource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
    //MARK :- Table View Delegate Method
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexpath.row]
            
            
        }
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Category in List", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
                newCategory.name = textField.text!
                self.categoryArray.append(newCategory)
                self.saveCategories()
            }
        
        alert.addTextField { (categoryTextField) in
            categoryTextField.placeholder = "Create New Category"
            textField = categoryTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    

    
    
    //MARK:- Data Manipulation Method
    func saveCategories() {   //Create
        
        
        do {
            
            try  context.save()
        }catch {
            print("Error saving the context \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadCategories() {     //Read
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categoryArray =  try context.fetch(request)
        } catch {
            print("Error Fetching the data \(error)")
        }
        tableView.reloadData()
    }
    
 
}
