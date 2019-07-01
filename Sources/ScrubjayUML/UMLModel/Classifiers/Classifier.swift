//
//  Classifier.swift
//  ScrubjayUML
//
//  Created by Stan Stadelman on 5/30/19.
//

import Foundation

/// A Classifier represents a classification of instances according to their Features.
/// - type: Abstract Class
protocol Classifier {
    /// If true, the Classifier can only be instantiated by instantiating one of its specializations. An abstract Classifier is intended to be used by other Classifiers e.g., as the target of Associations or Generalizations.
    /// - Returns: `false` by default
    var isAbstract: Bool { get }
    /// If true, the Classifier cannot be specialized.
    /// - Returns: `false` by default
    var isFinalSpecialization: Bool { get }
}

