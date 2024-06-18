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
            VStack {
                Text("hello")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.blue)
                    .padding()
                Text("Next")
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Whats app")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                })
                
            }
        }
        .navigationBarColor(.orange)
//        .modifier(NavigationBarColor(backgroundColor: .blue)) // Apply the NavigationBarColor modifier here
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


enum TextStyleModifierType {
    case light, medium, bolder

    var size: CGFloat {
        switch self {
        case .light:
            return 14
        case .medium:
            return 18
        case .bolder:
            return 24
        }
    }

    var weight: Font.Weight {
        switch self {
        case .light:
            return .regular
        case .medium:
            return .medium
        case .bolder:
            return .semibold
        }
    }

    var foregroundColor: Color {
        switch self {
        case .light:
            return .gray
        case .medium:
            return .black
        case .bolder:
            return .black
        }
    }

}


struct FontColorSizePadEnum: ViewModifier {
    
    var textStyleModifierType: TextStyleModifierType
    
    init(textStyleModifierType: TextStyleModifierType) {
        self.textStyleModifierType = textStyleModifierType
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: textStyleModifierType.size, weight: textStyleModifierType.weight))
            .foregroundStyle(textStyleModifierType.foregroundColor)
    }
}



struct FontColorSizePad: ViewModifier {
    var size:  CGFloat
    var weight: Font.Weight
    var forgroundStyle: Color
    
    init(size: CGFloat, weight: Font.Weight, color: Color) {
        self.size = size
        self.weight = weight
        self.forgroundStyle = color
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(self.forgroundStyle)
    }
}


extension View {
    
    func navigationBarColor(_ backgroundColor: Color) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
    
    func fontColorSizePad(size: CGFloat, weight: Font.Weight, color: Color = .indigo) -> some View {
        self.modifier(FontColorSizePad(size: size, weight: weight, color: color))
    }
    
    func fontColorSizePadEnum(textStyleModifierType: TextStyleModifierType) -> some View {
        self.modifier(FontColorSizePadEnum(textStyleModifierType: textStyleModifierType))
    }

}
 
