//
//  ToolbarItemRefactor.swift
//  UsableCodeTemplates
//
//  Created by Steven Hertz on 6/10/24.
//

import SwiftUI

struct ToolbarItemRefactor: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .toolbar {
                    doToolbarTrailing()
                }
        }
    }
}

extension ToolbarItemRefactor {
    @ToolbarContentBuilder
    func doToolbarTrailing() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) { Text("Cancel")}
    }
}

#Preview {
    ToolbarItemRefactor()
}
