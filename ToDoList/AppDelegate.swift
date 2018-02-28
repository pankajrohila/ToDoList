//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Pankaj Rohilla on 21/02/18.
//  Copyright © 2018 Pankaj Rohilla. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
//print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
            do {
            _ = try! Realm()
            }
        
        
        return true
    }


}

