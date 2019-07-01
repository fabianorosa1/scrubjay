//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/// A Constraint is a condition or restriction expressed in natural language text or in a machine readable language for the purpose of declaring some of the semantics of an Element or set of Elements.
protocol Constraint: PackageableElement {
    
    /// The ordered set of Elements referenced by this Constraint.
    /// - Important: opposite `A_constrainedElement_constraint::constraint`
    var constrainedElement: [Element] { get set }
    
    /// Specifies the Namespace that owns the Constraint.
    /// - Important: opposite `Namespace::ownedRule`
    var context: Namespace? { get set }
    
    /// A condition that must be true when evaluated in order for the Constraint to be satisfied.
    /// - Important: opposite `A_specification_owningConstraint::owningConstraint`
    var specification: ValueSpecification { get set }
}
