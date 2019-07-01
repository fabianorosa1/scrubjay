//
//  Package.swift
//  Basic
//
//  Created by Stan Stadelman on 5/6/19.
//

import Foundation

protocol Package: PackageableElement, Namespace {
    var URI: String { get set }
    
    // MARK: - AssociationEnds
    
    var nestedPackage: [Package] { get set }
    var nestingPackage: Package? { get set }
//    var ownedStereotype: [S]
    var ownedType: [Type] { get set }
}
