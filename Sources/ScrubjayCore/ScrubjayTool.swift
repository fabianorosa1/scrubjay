import Foundation
import Basic
import SourceKittenFramework
import SwiftSyntax
import CoreData



extension Array where Element == TokenSyntax {
    func isClosed() -> Bool {
        guard let last = last else { return false }
        return last.tokenKind == .rightBrace
    }
}

public final class ScrubjayTool {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public lazy var persistentContainer: NSPersistentContainer = {
        BaseModel.shared.persistentContainer
    }()
    
    
    public func run() throws {
        
//        guard arguments.count > 1 else {
//            throw Error.missingFileName
//        }
        // The first argument is the execution path
//        let fileName = arguments[1]
        let path = "/Users/stan/github/Scrubjay/.build/checkouts/SWXMLHash/Source/SWXMLHash.swift"
        let source = URL(fileURLWithPath: path)
        try highlight(source)
        
        
        
//        let source = URL(fileURLWithPath: CommandLine.arguments[1])
//        let sourceFile = try SyntaxTreeParser.parse(source)
//        print(sourceFile.statements.map { $0 })                /*
      /*   let commandantPath = "/Users/i826181/wdfgithub/fiori-test-apps/submodules/fioriuikit/src/Frameworks/SAPFiori/"
         let arguments = ["-project", "SAPFiori.xcodeproj", "-scheme", "SAPFiori"]
         let commandantModule = Module(xcodeBuildArguments: arguments, name: nil, inPath: commandantPath)!
         */
        
    }
    
    public func highlight(_ code: String) throws {
        let tempfile = try TemporaryFile(deleteOnClose: true)
        defer { tempfile.fileHandle.closeFile() }
        tempfile.fileHandle.write(code.data(using: .utf8)!)
        
        let url = URL(fileURLWithPath: tempfile.path.asString)
        return try highlight(url)
    }
    
    public func highlight(_ url: URL) throws {
        let sourceFile = try SyntaxTreeParser.parse(url)
        
        
        BaseModel.shared.persistentContainer.viewContext.perform {
            let fetchRequests: [NSFetchRequest<NSFetchRequestResult>] = [
                NSFetchRequest(entityName: "Attribute"),
                NSFetchRequest(entityName: "Class"),
                NSFetchRequest(entityName: "DataType"),
                NSFetchRequest(entityName: "Enum"),
                NSFetchRequest(entityName: "Interface"),
                NSFetchRequest(entityName: "Struct"),
                NSFetchRequest(entityName: "EnumCase"),
                NSFetchRequest(entityName: "Module"),
                NSFetchRequest(entityName: "Operation"),
                NSFetchRequest(entityName: "Package"),
                NSFetchRequest(entityName: "Parameter")]
            for request in fetchRequests {
                do {
                    let results = try request.execute()
                    for result in results {
                        switch result {
                        case is Attribute:
                            print("attr")
                        default:
                            print("not attr")
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
        }
        
        let highlighter = ScrubjayRewriter(managedObjectContext: BaseModel.shared.persistentContainer.viewContext)
        _ = highlighter.visit(sourceFile)
        do {
            try BaseModel.shared.persistentContainer.viewContext.save()
        }
        catch {
            print (error)
        }
    }
    
    
}

public extension ScrubjayTool {
    enum Error: Swift.Error {
        case missingFileName
        case couldNotFindXcodeproj
        case failedToLoadModule
    }
}
