//
//  Abstraction.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 4/2/19.
//

import Foundation

/// An Element is a constituent of a model. As such, it has the capability of owning other Elements.
protocol Element {
    /**
     The query allOwnedElements() gives all of the direct and indirect ownedElements of an Element.
     
     body: ownedElement->union(ownedElement->collect(e | e.allOwnedElements()))->asSet()
     
     */
    func allOwnedElements() -> Set<AnyElement>
    
    /// The query mustBeOwned() indicates whether Elements of this type must have an owner. Subclasses of Element that do not require an owner must override this operation.
    ///
    /// - Returns: true by default
    func mustBeOwned() -> Bool
    
    var owner: Element? { get set }
    
    var ownedElement: [AnyElement] { get set }
}

extension Element {
    func allOwnedElements() -> [AnyElement] { return ownedElement }
    func mustBeOwned() -> Bool { return true }
    
    /// Utility for `Equatable` requirement
    func isEqual(to rhs: Element) -> Bool {
        return self.allOwnedElements() == rhs.allOwnedElements() && self.mustBeOwned() == rhs.mustBeOwned()
    }
}

struct AnyElement: Element {
    
    private var _base: Element
    
    init<T: Element>(_ base: T) where T: Hashable {
        self._base = base
    }
    
    func allOwnedElements() -> Set<AnyElement> {
        return _base.allOwnedElements()
    }
    
    func mustBeOwned() -> Bool {
        return _base.mustBeOwned()
    }
    
    var owner: Element? {
        get { return _base.owner }
        set { _base.owner = newValue }
    }
    
    var ownedElement: [AnyElement] {
        get { return  _base.ownedElement }
        set { _base.ownedElement = newValue }
    }
    
}

extension AnyElement: Hashable {
    
    static func == (lhs: AnyElement, rhs: AnyElement) -> Bool {
        return lhs._base.isEqual(to: rhs._base)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(mustBeOwned())
        for e in allOwnedElements() {
            hasher.combine(e)
        }
        return
    }
    
}
