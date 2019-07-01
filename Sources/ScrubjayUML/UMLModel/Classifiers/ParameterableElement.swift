//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

protocol ParameterableElement: Element {
    var owningTemplateParameter: TemplateParameter?  { get set }
    var templateParameter: TemplateParameter? { get set }
    func isCompatibleWith(p: ParameterableElement) -> Bool
    func isTemplateParameter() -> Bool
}
