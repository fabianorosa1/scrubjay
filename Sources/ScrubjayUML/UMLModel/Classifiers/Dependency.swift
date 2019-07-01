//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/// A Dependency is a Relationship that signifies that a single model Element or a set of model Elements requires other model Elements for their specification or implementation. This means that the complete semantics of the client Element(s) are either semantically or structurally dependent on the definition of the supplier Element(s).
protocol Dependency: DirectedRelationship, PackageableElement {}
