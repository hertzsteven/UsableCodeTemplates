    //
    //  FloatingButtonBottomWithZstack.swift
    //  UsableCodeTemplates
    //
    //  Created by Steven Hertz on 6/25/24.
    //

import SwiftUI

struct FloatingButtonBottomWithZstack: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ForEach(1..<22) { item in
                    Text("Say Hello to \(item)")
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .background(Color(.systemGray4))
                }
            }
            VStack (alignment: .trailing)
            {
                Spacer()
                HStack {
                    Spacer()
                    Text("rkkrkrkrkkr")
//                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(lineWidth: 1.0))
                        .padding(.bottom,8)
                 }
            }
        }
    }
}
#Preview {
    FloatingButtonBottomWithZstack()
}
