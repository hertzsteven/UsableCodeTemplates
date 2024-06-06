//
//  ScrollViewCaptureItemChange.swift
//  UsableCodeTemplates
//
//  Created by Steven Hertz on 6/6/24.
//


import SwiftUI


struct ScrollViewCaptureItemChange {
    var items = [Color.green, Color.blue, Color.purple, Color.pink,
                 Color.yellow, Color.orange]
    @State private var currentColor: Color? = Color.green
}

extension ScrollViewCaptureItemChange {
    
}

extension ScrollViewCaptureItemChange: View {
  var body: some View {
    VStack(spacing:16) {
      firstViewFromFunction()
        Divider()
      secondViewFromFunction()
      thirdViewFromFunction()
      fourthViewFromFunction()
    }
    .padding()
  }
}


extension ScrollViewCaptureItemChange {
  
  fileprivate func firstViewFromFunction() -> some View {
    
      VStack(spacing: 24.0) {
          ScrollView(.horizontal) {
              HStack(spacing: 0) {
                  ForEach(items, id: \.self) { item in
                      RoundedRectangle(cornerRadius: 15)
                          .fill(item)
                          .padding()
                          .containerRelativeFrame(.horizontal)
                  }
              }
              .scrollTargetLayout()
          }
          .scrollTargetBehavior(.paging)
          .scrollPosition(id: $currentColor)
          .onChange(of: currentColor) {
              print(currentColor?.description ?? "blank")
          }
          
          Text("\(currentColor?.description.capitalized ?? "None")")
          
          Button("Go to Orange") {
              withAnimation {
                  currentColor = Color.orange
              }
          }
      }
      .font(.title)
      
  }
  
  fileprivate func secondViewFromFunction() -> some View {
    
    Image(systemName: "globe")
      .imageScale(.large)
      .foregroundStyle(.tint)
    
  }
  
  fileprivate func thirdViewFromFunction() -> some View {
    
    Text("From Third View")
    
  }
  
  fileprivate func fourthViewFromFunction() -> some View {
    
    Text("From Fourth View")
    
  }
  
}



#Preview {
    ScrollViewCaptureItemChange()
}
