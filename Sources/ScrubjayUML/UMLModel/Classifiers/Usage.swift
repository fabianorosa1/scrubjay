//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation
/**
 A Usage is a Dependency in which one NamedElement requires another NamedElement (or set of NamedElements) for its full implementation or operation. The Usage does not specify how the client uses the supplier other than the fact that the supplier is used by the definition or implementation of the client.

 */
protocol Usage: Dependency {}
