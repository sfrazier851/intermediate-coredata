//
//  CoreDataManager.swift
//  IntermediateCDTraining
//
//  Created by iMac on 8/3/22.
//

import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IntermediateCDTraining")
        container.loadPersistentStores() { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
}
