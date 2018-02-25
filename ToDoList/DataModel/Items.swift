//
//  File.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 24/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import Foundation

class Item: Encodable,Decodable {
    
    var title : String = ""
    var done : Bool = false
}
