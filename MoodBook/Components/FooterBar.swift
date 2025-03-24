//
//  FooterBar.swift
//  MoodBook
//
//  Created by Keshu Rai on 23/03/25.
//

import SwiftUI

enum SelectedFooterOption {
    case home,stats, addMood, history, settings
}

struct FooterBar: View {
    
    @State private var showAddMoodSheet : Bool = false
    
    @Binding var selectedOption: SelectedFooterOption


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 0.5) // Border stroke
            
            HStack(alignment: .center) {
                FooterMenuItem(image: UIImage.home, heading: "Home") {
                    selectedOption = .home
                }
                Spacer()
                FooterMenuItem(image: UIImage.chart, heading: "Stats") {
                    selectedOption = .stats
                }
                Spacer()
                FooterMenuItem(image: UIImage.add, heading: "Add Mood", isBig: false, tintColor: .accentColor) {
                    selectedOption = .addMood
                }
                Spacer()
                FooterMenuItem(image: UIImage.note, heading: "History") {
                    selectedOption = .history
                }
                Spacer()
                FooterMenuItem(image: UIImage.settings, heading: "Settings") {
                    selectedOption = .settings
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20)) // Clipping the background
        }
        .frame(height: 70)
        .padding(.horizontal, 10) // Add padding to avoid clipping at edges
    }
}

#Preview {
    FooterBar(selectedOption: .constant(.home))
}
