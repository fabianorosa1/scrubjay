//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

protocol TypedElement: NamedElement {
    var type: Type { get set }
}
