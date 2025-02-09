//
//  StyleGuide.swift
//  MoodBook
//
//  Created by Keshu Rai on 09/02/25.
//

import Foundation
import SwiftUI

enum FontStyle {
    case regular, medium, bold
}

enum Typography {
    case heading1, heading2, heading3
    case subText1, subText2, subText3
}


//MARK: Usage
extension View {
    func appFont(type: Typography, style: FontStyle? = nil) -> some View {
        modifier(AppFontModifier(type: type, fontStyle: style))
    }
}

//MARK: Implementation
fileprivate struct AppFontModifier: ViewModifier {
    
    var type: Typography
    var fontStyle: FontStyle?
    
    private let fontNames = [
        FontStyle.regular: "PPPangramSansRounded-CompactRegular",
        FontStyle.medium: "PPPangramSansRounded-Medium",
        FontStyle.bold: "PPPangramSansRounded-Bold"
    ]
    
    private func getFontName() -> String {
        return fontStyle.flatMap { fontNames[$0] } ?? defaultFontName(for: type)
    }
    
    private func defaultFontName(for type: Typography) -> String {
        switch type {
        case .heading1: return fontNames[.bold]!
        case .heading2, .heading3: return fontNames[.medium]!
        case .subText1, .subText2, .subText3: return fontNames[.regular]!
        }
    }
    
    private func getFontSize() -> CGFloat {
        switch type {
        case .heading1: return 24
        case .heading2: return 18
        case .heading3: return 14
        case .subText1: return 16
        case .subText2: return 14
        case .subText3: return 12
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(getFontName(), size: getFontSize()))
    }
}

