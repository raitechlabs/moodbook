//
//  Helper.swift
//  MoodBook
//
//  Created by Keshu Rai on 10/02/25.
//

import Foundation
import SwiftUI

// Helper Extension to Convert Hex to SwiftUI Color
extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&int)
        let r, g, b: Double
        switch hexSanitized.count {
        case 6: // RGB (No Alpha)
            r = Double((int >> 16) & 0xFF) / 255
            g = Double((int >> 8) & 0xFF) / 255
            b = Double(int & 0xFF) / 255
        default:
            r = 1.0
            g = 1.0
            b = 1.0
        }
        self.init(red: r, green: g, blue: b)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
