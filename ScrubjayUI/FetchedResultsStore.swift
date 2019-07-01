//
//  FetchedResultsStore.swift
//  ScrubjayUI
//
//  Created by Stan Stadelman on 6/23/19.
//

import Foundation
import CoreData
import SwiftUI
import Combine
import ScrubjayCore

//https://forums.developer.apple.com/thread/117655



final class QueryListStore: NSObject, BindableObject, NSFetchedResultsControllerDelegate {
    
    var didChange = PassthroughSubject<QueryListStore, Never>()
    var results = [Element]()
    var controller = NSFetchedResultsController<Element>()
    
    override init() {
        
        super.init()
        /* Create and configure fetched results controller */
        
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<Element>) {
        
        var viewModels = [Element]()
        
        /* Iterate over results, initalizing view models from your managed objects and adding them to the array
         
         let viewModel = MyViewModel(managedObject: managedObject)
         viewModels.append(viewModel)
         
         */
        
        self.results = viewModels
        
        didChange.send(self)
    }
}
