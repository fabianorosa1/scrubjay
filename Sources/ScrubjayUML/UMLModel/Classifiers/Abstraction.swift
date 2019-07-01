//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/**
 An Abstraction is a Relationship that relates two Elements or sets of Elements that represent the same concept at different levels of abstraction or from different viewpoints.
 
 An Abstraction is a Dependency that relates two NamedElements or sets of NamedElements that represent the same concept at different levels of abstraction or from different viewpoints. The relationship may be defined as a mapping between the suppliers and the clients. Depending on the specific stereotype of Abstraction, the mapping may be formal or informal, and it may be unidirectional or bidirectional. Abstraction has predefined stereotypes (such as «Derive», «Refine», and «Trace») that are defined in the Standard Profile (see Clause 22). If an Abstraction has more than one client, the supplier maps into the set of clients as a group. For example, an analysis-level Class might be split into several design-level Classes. The situation is similar if there is more than one supplier.
 */
protocol Abstraction: Dependency {
    
    /// An OpaqueExpression that states the abstraction relationship between the supplier(s) and the client(s). In some cases, such as derivation, it is usually formal and unidirectional; in other cases, such as trace, it is usually informal and bidirectional. The mapping expression is optional and may be omitted if the precise relationship between the Elements is not specified.
    /// - Important: opposite `A_mapping_abstraction::abstraction`
  // var mapping: OpaqueExpression? { get set }
}
