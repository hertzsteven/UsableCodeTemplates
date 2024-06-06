//
//  ContentView.swift
//  UsableCodeTemplates
//
//  Created by Steven Hertz on 6/6/24.
//

import SwiftUI


struct MyContentView {
    
    @State var currentIndex: Int = 0
        
}

extension MyContentView {
     
}

extension MyContentView: View {
    var body: some View {
        VStack(spacing:16) {
//            firstViewFromFunction()
            secondViewFromFunction()
//            thirdViewFromFunction()
//            fourthViewFromFunction()
//            Text("Current Image: \(images[currentIndex])")
//                .font(.headline)
//                .padding()
        }
        .padding()
    }
}


extension MyContentView {
    func firstViewFromFunction() -> some View {
        let images = ["d1", "d2", "d3", "d4","d1", "d2", "d3", "d4" ]
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(images, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .cornerRadius(25)
                        .frame(width: 200, height:200 )
                        .shadow(radius: 10, y: 10)
                }
            }
            .scrollTargetLayout()
        }
        .frame(height: 260)
        .safeAreaPadding(32)
        .scrollClipDisabled()
        .scrollTargetBehavior(.viewAligned)
            //        .contentMargins(20)
            //        .background {Color(.systemGray4)}    }
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
//        let images = ["d1", "d2", "d3", "d4","d1", "d2", "d3", "d4" ]
//        return ScrollView(.horizontal, showsIndicators: false) { 
//            HStack {
//                ForEach(images.enumerated(), id: \.self) { index, item in
//                    Image(item)
//                        .resizable()
//                        .cornerRadius(25)
//                        .frame(width: 200, height:200 )
//                        .shadow(radius: 10, y: 10)
//                        .onAppear {
//                            currentIndex = index
//                        }
//                }
//            }
//            .scrollTargetLayout()
//        }
//        .frame(height: 260)
//        .safeAreaPadding(32)
//        .scrollClipDisabled()
//        .scrollTargetBehavior(.viewAligned)
//        //        .contentMargins(20)
//        //        .background {Color(.systemGray4)}    }
        EmptyView()
    }

    
}


#Preview {
    MyContentView()
}
