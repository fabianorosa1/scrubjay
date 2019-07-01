//
//  Rewriter.swift
//  ScrubjayCore
//
//  Created by Stan Stadelman on 5/30/19.
//

import Foundation
import SwiftSyntax
import CoreData



public class ScrubjayRewriter: SyntaxRewriter {
    
    weak var context: NSManagedObjectContext! {
        didSet {
            self.context?.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        }
    }
    
    var declarationStack: [Declaration] = []
    var previous: Element? = nil
    
    convenience init(managedObjectContext context: NSManagedObjectContext) {
        self.init()
        self.context = context
    }
    
    var tokenStack: [[TokenSyntax]] = []
    
    
    // MARK: - DeclSyntax overrides
    
    override open func visit(_ node: UnknownDeclSyntax) -> DeclSyntax {
        return super.visit(node)
    }
    
    // MARK: Typealias
    open override func visit(_ node: TypealiasDeclSyntax) -> DeclSyntax {
        
        func bind(node: TypealiasDeclSyntax, to e: DataType) {
            
            e.visibility = "public"
            self.declarationStack.append(e)
            self.previous = e
        }
        
        guard case .success(let e) = getNewOrExisting(entity: DataType.self, with: node.identifier.text) else {
            preconditionFailure()
        }
        bind(node: node, to: e)
        
        return super.visit(node)
    }
    
    open override func visit(_ node: AssociatedtypeDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    
    // MARK: Class
    open override func visit(_ node: ClassDeclSyntax) -> DeclSyntax {

        func bind(node: ClassDeclSyntax, to e: Class) {
            
            e.visibility = "public"
            e.name = node.identifier.text
            self.declarationStack.append(e)
            self.previous = e
        }
        
        guard case .success(let e) = getNewOrExisting(entity: Class.self, with: node.identifier.text) else {
            preconditionFailure()
        }
        bind(node: node, to: e)
        
        return super.visit(node)
    }
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: StructDeclSyntax) -> DeclSyntax {

        print(node.identifier.text)
        
        func bind(node: StructDeclSyntax, to e: Struct) {
            
            e.visibility = "public"
            e.name = node.identifier.text
            self.declarationStack.append(e)
            self.previous = e
        }
        
        guard case .success(let e) = getNewOrExisting(entity: Struct.self, with: node.identifier.text) else {
            preconditionFailure()
        }
        bind(node: node, to: e)
        
        return super.visit(node)
    }
    
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: ProtocolDeclSyntax) -> DeclSyntax {

        func bind(node: ProtocolDeclSyntax, to e: Interface) {
            
            e.visibility = "public"
            e.name = node.identifier.text
            self.declarationStack.append(e)
            self.previous = e
        }
        
        guard case .success(let e) = getNewOrExisting(entity: Interface.self, with: node.identifier.text) else {
            preconditionFailure()
        }
        bind(node: node, to: e)
        
        return super.visit(node)
    }
    
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: ExtensionDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: InitializerDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: DeinitializerDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: SubscriptDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }

    open override func visit(_ node: ImportDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    
    open override func visit(_ node: AccessorDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }


    // MARK: Variable
    open override func visit(_ node: VariableDeclSyntax) -> DeclSyntax {
        
        func bind(node: VariableDeclSyntax, to e: Attribute) {

            e.name = node.bindings.first?.pattern.description
            e.visibility = "internal"
            e.isLet = node.letOrVarKeyword.text == "let"
            if let last = declarationStack.last {
                last.addToAttributes(e)
            }
        }
        
        guard case .success(let e) = getNewOrExisting(entity: Attribute.self, with: node.bindings.description) else {
            preconditionFailure()
        }
        bind(node: node, to: e)
        
        return super.visit(node)
    }
    open override func visit(_ node: EnumCaseDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    open override func visit(_ node: EnumDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    open override func visit(_ node: OperatorDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    open override func visit(_ node: PrecedenceGroupDeclSyntax) -> DeclSyntax {
        // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 34)
        return super.visit(node)
    }
    
    
    // MARK: Function
    // ###sourceLocation(file: "/private/tmp/ss/swift-syntax/Sources/SwiftSyntax/SyntaxRewriter.swift.gyb", line: 32)
    open override func visit(_ node: FunctionDeclSyntax) -> DeclSyntax {
        //
        func bind(node: FunctionDeclSyntax, to e: ScrubjayCore.Operation) {
            
            e.name = "\(node.identifier)\(node.signature)"
            e.visibility = "internal"
            if let last = declarationStack.last {
                last.addToOperations(e)
            }
        }
        
        guard case .success(let e) = getNewOrExisting(entity: ScrubjayCore.Operation.self, with: "\(node.identifier)\(node.signature)") else {
            preconditionFailure()
        }
        bind(node: node, to: e)
        
        return super.visit(node)
    }
    
}

extension ScrubjayRewriter {
    
    enum Error: Swift.Error {
        case unknown(error: Swift.Error)
    }
    
    func getNewOrExisting<U>(entity: U.Type, with pattern: String) -> Result<U, ScrubjayRewriter.Error> where U: Element {
        guard let umlType = U.umlType(),
            let id = (umlType + "." + pattern).md5(),
            let entityName = U.entity().name else { preconditionFailure() }
        
        let fetchRequest = NSFetchRequest<U>(entityName: entityName)
        let predicate = NSPredicate(format: "id_ == %@", id)
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            assert(result.count < 2)
            let e = result.first ?? U(context: context)
            e.id_ = id
            e.type = umlType
            return .success(e)
        }
        catch {
            return .failure(.unknown(error: error))
        }
    }
}
