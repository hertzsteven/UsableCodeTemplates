//
//  NavigationBarBackgroundMOd.swift
//  UsableCodeTemplates
//
//  Created by Steven Hertz on 6/6/24.
//

import SwiftUI

struct NavigationBarBackgroundMOd: View {
    var body: some View {
        NavigationStack {
            Text("hello")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Whats app")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                })
        }
        .modifier(NavigationBarColor(backgroundColor: .blue)) // Apply the NavigationBarColor modifier here
    }
}

#Preview {
    NavigationBarBackgroundMOd()
}



struct NavigationBarColor: ViewModifier {
    var backgroundColor: Color

    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor)
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: Color) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
}
 
//                             .navigationBarColor(Color(.darkGray))

