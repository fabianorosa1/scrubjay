//
//  Declaration.swift
//  Basic
//
//  Created by Stan Stadelman on 6/30/19.
//

import Foundation
import CoreData

@objc(Declaration)
public class Declaration: Element {
    
}

extension Declaration {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Declaration> {
        return NSFetchRequest<Declaration>(entityName: "Declaration")
    }
    
    @NSManaged public var attributes: NSOrderedSet
    @NSManaged public var operations: NSOrderedSet
    
}

// MARK: Generated accessors for attributes
extension Declaration {
    
    @objc(addAttributesObject:)
    @NSManaged public func addToAttributes(_ value: Attribute)
    
    @objc(removeAttributesObject:)
    @NSManaged public func removeFromAttributes(_ value: Element)
    
    @objc(addAttributes:)
    @NSManaged public func addToAttributes(_ values: NSSet)
    
    @objc(removeAttributes:)
    @NSManaged public func removeFromAttributes(_ values: NSSet)
    
    @objc(addOperationsObject:)
    @NSManaged public func addToOperations(_ value: ScrubjayCore.Operation)
    
    @objc(removeOperationsObject:)
    @NSManaged public func removeFromOperations(_ value: Element)
    
    @objc(addOperations:)
    @NSManaged public func addToOperations(_ values: NSSet)
    
    @objc(removeOperations:)
    @NSManaged public func removeFromOperations(_ values: NSSet)
    
}
