import ScrubjayCore
import CoreData

let tool = ScrubjayTool()


do {
    try tool.run()
} catch {
    print(error)
}
