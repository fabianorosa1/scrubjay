//
//  ContentView.swift
//  ScrubjayUI
//
//  Created by Stan Stadelman on 6/23/19.
//

import SwiftUI
import ScrubjayCore

struct ContentView : View {
    
    @ObjectBinding var viewModel: DataModel = DataModel.shared
    
    func attributes(for decl: ScrubjayCore.Declaration) -> [ScrubjayCore.Attribute] {
        return decl.attributes.array as! [Attribute]
    }
    
    func operations(for decl: ScrubjayCore.Declaration) -> [ScrubjayCore.Operation] {
        return decl.operations.array as! [ScrubjayCore.Operation]
    }
    
    var body: some View {
        List(self.viewModel.classes) { c in
            VStack(alignment: .leading) {
                Text(c.name!).frame(maxWidth: .infinity, maxHeight: .infinity).font(.headline)
                ForEach(self.attributes(for: (c as! Declaration))) { attr in
                    Text(attr.name!).font(.subheadline).color(.gray)
                }
                ForEach(self.operations(for: (c as! Declaration))) { o in
                    Text(o.name!).font(.subheadline).color(.accentColor)
                }
                Divider()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
