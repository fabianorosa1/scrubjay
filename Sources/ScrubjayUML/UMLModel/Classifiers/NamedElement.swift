//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/// A NamedElement is an Element in a model that may have a name. The name may be given directly and/or via the use of a StringExpression.
protocol NamedElement: Element {
    
    // MARK: - Attributes
    /// The name of the NamedElement.
    var name: String { get set }
    
    /// A name that allows the NamedElement to be identified within a hierarchy of nested Namespaces. It is constructed from the names of the containing Namespaces starting at the root of the hierarchy and ending with the name of the NamedElement itself.
    var qualifiedName: String { get }
    
    /// Determines whether and how the NamedElement is visible outside its owning Namespace.
    var visibility: VisibilityKind { get set }
    
    // MARK: - Association Ends
    /// Indicates the Dependencies that reference this NamedElement as a client.
    var clientDependency: [Dependency] { get }
    var nameExpression: String { get set }
    var namespace: Namespace? { get }
}
