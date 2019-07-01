//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation
/// A PackageableElement is a NamedElement that may be owned directly by a Package. A PackageableElement is also able to serve as the parameteredElement of a TemplateParameter.
protocol PackageableElement: NamedElement {
    
    /// A PackageableElement must have a visibility specified if it is owned by a Namespace. The default visibility is public.
    /// - Returns: `true` by default
    var visibility: VisibilityKind { get set }
}
