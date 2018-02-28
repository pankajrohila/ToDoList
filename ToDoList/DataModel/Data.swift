//
//  Data.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 28/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import Foundation
import RealmSwift

class Data : Object {
    @objc dynamic var  name : String = ""
    @objc dynamic var age : Int = 0
}
