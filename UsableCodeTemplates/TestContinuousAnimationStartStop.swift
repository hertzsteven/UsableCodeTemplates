//
//  dummy1.swift
//  UsableCodeTemplates
//
//  Created by Steven Hertz on 6/6/24.
//

import SwiftUI

struct TestContinuousAnimationStartStop: View {
    var body: some View {
        CirclePathProgressView()
    }

    struct CirclePathProgressView : View {
        @State private var isAnimating = false
        @State private var showProgress = false

        var foreverAnimation: Animation {
            Animation.linear(duration: 2.0)
                .repeatForever(autoreverses: false)
        }

        var body: some View {
            Button(action: { self.showProgress.toggle() }, label: {
                if showProgress {
                    Image(systemName: "arrow.2.circlepath")
                        .font(.system(size: 72))
                        .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                        .animation(self.isAnimating ? foreverAnimation : .default, value: isAnimating)
                        .onAppear { self.isAnimating = true }
                        .onDisappear { self.isAnimating = false }
                } else {
                    Image(systemName: "arrow.2.circlepath")
                }
            })
            .onAppear { self.showProgress = true }
        }
    }
}

#Preview {
    TestContinuousAnimationStartStop()
}
