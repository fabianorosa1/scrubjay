//
//  AppDelegate.swift
//  ScrubjayUI
//
//  Created by Stan Stadelman on 6/23/19.
//

import Cocoa
import SwiftUI
import ScrubjayCore
import Combine

class DataModel: NSObject, BindableObject {
    
    static let shared = DataModel()
    private override init() {}
    
    var classes: [ScrubjayCore.Class] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    public let didChange = PassthroughSubject<DataModel, Never>()
    
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")

        window.contentView = NSHostingView(rootView: ContentView())

        window.makeKeyAndOrderFront(nil)
        
        let tool = ScrubjayTool()
        
        do {
            try tool.run()
        } catch {
            print(error)
        }
        
        tool.persistentContainer.viewContext.perform {
            let fetchRequests: [NSFetchRequest<NSFetchRequestResult>] = [
                //                    NSFetchRequest(entityName: "Attribute"),
                NSFetchRequest(entityName: "Class"),
                NSFetchRequest(entityName: "DataType"),
                NSFetchRequest(entityName: "Enum"),
                NSFetchRequest(entityName: "Interface"),
                NSFetchRequest(entityName: "Struct"),
                //                    NSFetchRequest(entityName: "EnumCase"),
                NSFetchRequest(entityName: "Module"),
                NSFetchRequest(entityName: "Operation"),
                //                    NSFetchRequest(entityName: "Package"),
                //                    NSFetchRequest(entityName: "Parameter")
            ]
            for request in fetchRequests {
                do {
                    request.returnsObjectsAsFaults = false
                    let results = try request.execute()
                    for result in results {
                        switch result {
                        case is Attribute:
                            print("attr")
                        case is Class:
                            DataModel.shared.classes.append(result as! Class)
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

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ScrubjayUI")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving and Undo support

    @IBAction func saveAction(_ sender: AnyObject?) {
        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
        let context = persistentContainer.viewContext

        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }

    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
        // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
        return persistentContainer.viewContext.undoManager
    }

    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        // Save changes in the application's managed object context before the application terminates.
        let context = persistentContainer.viewContext
        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
            return .terminateCancel
        }
        
        if !context.hasChanges {
            return .terminateNow
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError

            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror)
            if (result) {
                return .terminateCancel
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            alert.addButton(withTitle: cancelButton)
            
            let answer = alert.runModal()
            if answer == .alertSecondButtonReturn {
                return .terminateCancel
            }
        }
        // If we got here, it is time to quit.
        return .terminateNow
    }

}

