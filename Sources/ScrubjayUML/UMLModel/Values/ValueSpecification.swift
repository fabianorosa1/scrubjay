//
//  ValueSpecification.swift
//  Basic
//
//  Created by Stan Stadelman on 4/18/19.
//

import Foundation

/// A ValueSpecification is the specification of a (possibly empty) set of values. A ValueSpecification is a ParameterableElement that may be exposed as a formal TemplateParameter and provided as the actual parameter in the binding of a template.
protocol ValueSpecification: TypedElement, PackageableElement {
    
    /// The query booleanValue() gives a single Boolean value when one can be computed.
    ///
    ///     body: null
    ///
    /// - Returns: an optional `Bool` value
    func booleanValue() -> Bool?
    
    /// The query integerValue() gives a single Integer value when one can be computed.
    ///
    ///     body: null
    ///
    /// - Returns: an optional `Int` value
    func integerValue() -> Int?
    
    /// The query isCompatibleWith() determines if this ValueSpecification is compatible with the specified ParameterableElement. This ValueSpecification is compatible with ParameterableElement p if the kind of this ValueSpecification is the same as or a subtype of the kind of p. Further, if p is a TypedElement, then the type of this ValueSpecification must be conformant with the type of p.
    ///
    /// - Parameter p: value which may be typed
    /// - Returns: whether `Self` is same or subtype of `p`
    func isCompatibleWith(p: ParameterableElement) -> Bool
    
    /// The query isComputable() determines whether a value specification can be computed in a model. This operation cannot be fully defined in OCL. A conforming implementation is expected to deliver true for this operation for all ValueSpecifications that it can compute, and to compute all of those for which the operation is true. A conforming implementation is expected to be able to compute at least the value of all LiteralSpecifications.
    ///
    ///     body: false
    ///
    /// - Returns: `Self` may compute the value of all `LiteralSpecifications`.
    func isComputable() -> Bool
    
    /// The query isNull() returns true when it can be computed that the value is null.
    ///
    ///     body: false
    ///
    /// - Returns: the value is `null`
    func isNull() -> Bool
    /*
    /// The query realValue() gives a single Real value when one can be computed.
    ///
    ///     body: null
    ///
    /// - Returns: an optional single `Real` value
    func realValue() -> Real?
    
    /// The query stringValue() gives a single String value when one can be computed.
    ///
    ///     body: null
    ///
    /// - Returns: an optional String value
    func stringValue() -> String?
    
    /// The query unlimitedValue() gives a single UnlimitedNatural value when one can be computed.
    ///
    ///     body: null
    ///
    /// - Returns: an optional `UnlimitedNatural` value
    func unlimitedValue() -> UnlimitedNatural?
 */
}
