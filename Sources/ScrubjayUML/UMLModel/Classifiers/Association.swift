//
//  Association.swift
//  ScrubjayUML
//
//  Created by Stan Stadelman on 5/30/19.
//

import Foundation

/// A link is a tuple of values that refer to typed objects. An Association classifies a set of links, each of which is an instance of the Association. Each value in the link refers to an instance of the type of the corresponding end of the Association.
protocol Association: Classifier, Relationship {
    /// Specifies whether the Association is derived from other model elements such as other Associations.
    /// - Returns: `false` by default
    var isDerived: Bool { get set }
}

class AssociationImpl: Association {
    var owner: Element?
    
    var ownedElement: [AnyElement] = []
    
    func allOwnedElements() -> Set<AnyElement> {
        return []
    }
    
    
    /// Specifies whether the Association is derived from other model elements such as other Associations.
    var isDerived: Bool = false
    
    // MARK: - Classifier
    var isAbstract: Bool = false
    var isFinalSpecialization: Bool = false
    
}
