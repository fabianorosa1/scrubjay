//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/**
 Realization is a specialized Abstraction relationship between two sets of model Elements, one representing a specification (the supplier) and the other represents an implementation of the latter (the client). Realization can be used to model stepwise refinement, optimizations, transformations, templates, model synthesis, framework composition, etc.
 
 Realization is a specialized Abstraction dependency between two sets of NamedElements, one representing a specification (the supplier) and the other representing an implementation of that specification (the client). Realization can be used to model stepwise refinement, optimizations, transformations, templates, model synthesis, framework composition, etc. A Realization signifies that the set of clients is an implementation of the set of suppliers, which serves as the specification. The meaning of “implementation” is not strictly defined, but rather implies a more refined or elaborate form in respect to a certain modeling context. It is possible to specify a mapping between the specification and implementation elements, although this is not necessarily computable.
 */
protocol Realization: Abstraction {}
