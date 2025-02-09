//
//  ColorStyle.swift
//  MoodBook
//
//  Created by Keshu Rai on 10/02/25.
//

import Foundation
import SwiftUI

enum UIColorStyle {
    case primary1, primary2, primary3
}

enum ChartColorStyle {
    case green, red, blue, orange
}

enum TextColorStyle {
    case black, darkGray, gray, gold, red
}

enum GradientStyle {
    case gradient1, gradient2, gradient3, gradient4
}

// MARK: - Color Modifier
fileprivate struct AppColorModifier: ViewModifier {
    
    var uiColor: UIColorStyle?
    var chartColor: ChartColorStyle?
    var textColor: TextColorStyle?
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(getColor())
    }
    
    private func getColor() -> Color {
        if let uiColor = uiColor {
            return getUIColor(uiColor)
        } else if let chartColor = chartColor {
            return getChartColor(chartColor)
        } else if let textColor = textColor {
            return getTextColor(textColor)
        }
        return .clear
    }
    
    private func getUIColor(_ style: UIColorStyle) -> Color {
        switch style {
        case .primary1: return Color(hex: "#8B4CFC")
        case .primary2: return Color(hex: "#FAD9E6")
        case .primary3: return Color(hex: "#DED7FA")
        }
    }
    
    private func getChartColor(_ style: ChartColorStyle) -> Color {
        switch style {
        case .green: return Color(hex: "#8B4CFC").opacity(0.75)
        case .red: return Color(hex: "#FF1F11").opacity(0.75)
        case .blue: return Color(hex: "#3686FF").opacity(0.75)
        case .orange: return Color(hex: "#FF5C00").opacity(0.75)
        }
    }
    
    private func getTextColor(_ style: TextColorStyle) -> Color {
        switch style {
        case .black: return Color(hex: "#100F11")
        case .darkGray: return Color(hex: "#100F11").opacity(0.74)
        case .gray: return Color(hex: "#100F11").opacity(0.64)
        case .gold: return Color(hex: "#E8B50E")
        case .red: return Color(hex: "#FC4C4C")
        }
    }
    
}

// MARK: - Gradient Modifier
fileprivate struct GradientBackgroundModifier: ViewModifier {
    
    var gradientStyle: GradientStyle
    
    func body(content: Content) -> some View {
        content.background(getGradient())
    }
    
    private func getGradient() -> LinearGradient {
        switch gradientStyle {
        case .gradient1:
            return LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#EED3F2"), Color(hex: "#EED3F2")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gradient2:
            return LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#C3FFD4"), Color(hex: "#CFCFCB"), Color(hex: "#EFF9F2")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gradient3:
            return LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#BACFFF").opacity(0.67), Color(hex: "#FFCEB7")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .gradient4:
            return LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#D0CFE9").opacity(0.34), Color(hex: "#FFCEB7"), Color(hex: "#DF2771").opacity(0.55), Color(hex: "#BAE6FF").opacity(0.67)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}


extension View {
    func appColor(ui: UIColorStyle? = nil, chart: ChartColorStyle? = nil, text: TextColorStyle? = nil) -> some View {
        self.modifier(AppColorModifier(uiColor: ui, chartColor: chart, textColor: text))
    }
    func appGradient(_ style: GradientStyle) -> some View {
           self.modifier(GradientBackgroundModifier(gradientStyle: style))
       }
}

