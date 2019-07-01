//
//  Base+Extensions.swift
//  ScrubjayUI
//
//  Created by Stan Stadelman on 6/24/19.
//

import Foundation
import CoreData
import SwiftUI


extension Element: Identifiable {
    public var id: String {
        return self.id_!
    }
    
    public typealias ID  = String
}
