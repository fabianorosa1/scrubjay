//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/// A Comment is a textual annotation that can be attached to a set of Elements.
protocol Comment: Element {
    
    /// Specifies a string that is the comment.
    var body: String { get set }
    
    /// References the Element(s) being commented.
    /// - Important: opposite `A_annotatedElement_comment::comment`
    var annotatedElement: Set<AnyElement> { get set }
}
