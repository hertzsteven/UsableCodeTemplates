//
//  ContentView.swift
//  UsableCodeTemplates
//
//  Created by Steven Hertz on 6/6/24.
//

import SwiftUI


struct ScrollViewWithTransitionView {
    
    @State var currentIndex: Int = 0
        
}

extension ScrollViewWithTransitionView {
     
}


extension ScrollViewWithTransitionView: View {
    var body: some View {
        VStack(spacing:16) {
//            firstViewFromFunction()
            secondViewFromFunction()
//            thirdViewFromFunction()
//            fourthViewFromFunction()
        }
        .padding()
    }
}


extension ScrollViewWithTransitionView {
    
    func firstViewFromFunction() -> some View {
        EmptyView()
    }
    
    func secondViewFromFunction() -> some View {
        let images = ["d1", "d2", "d3", "d4", ]
        return ScrollView(.horizontal) {
            LazyHStack(content: {
                ForEach(images, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .clipped()
                    
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8)
                                .scaleEffect(y: phase.isIdentity ? 1.0 : 0.8)
                                .offset(y: phase.isIdentity ? 0 : 140)
                        }
                }
            })
        }
        .contentMargins(20)
        .background {Color(.systemGray4)}   
    }
    
    func thirdViewFromFunction() -> some View {
        Text("From Third View")
    }

    func fourthViewFromFunction() -> some View {

        EmptyView()
    }
    
}


#Preview {
    ScrollViewWithTransitionView()
}
