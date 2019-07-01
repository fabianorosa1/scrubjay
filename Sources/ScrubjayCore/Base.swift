//
//  Base.swift
//  ScrubjayUI
//
//  Created by Stan Stadelman on 6/24/19.
//

import Foundation
import CoreData

struct BaseModel {
    static var shared: BaseModel = BaseModel()
    
    private init() {}
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        guard let bundlePath = Bundle(for: ScrubjayTool.self).url(forResource: "Base", withExtension: "momd"),
            let managedObjectModel = NSManagedObjectModel(contentsOf: bundlePath) else { preconditionFailure() }
        
        let container = NSPersistentContainer(name: "Base", managedObjectModel: managedObjectModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
}
