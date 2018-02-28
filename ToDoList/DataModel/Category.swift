//
//  Category.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 28/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()  //Array of Item class--Forward Relationship
}
