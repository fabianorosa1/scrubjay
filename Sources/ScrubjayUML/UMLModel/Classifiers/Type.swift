//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

protocol Type: PackageableElement {
    var package: Package? { get set }
    
    func conformsTo(other: Type) -> Bool 
}
