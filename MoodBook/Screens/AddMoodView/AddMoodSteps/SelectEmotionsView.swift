//
//  SelectEmotionsView.swift
//  MoodBook
//
//  Created by Keshu Rai on 25/03/25.
//

import SwiftUI

struct SelectEmotionsView : View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Choose the emotions that make you feel neutral")
                .appFont(type: .heading2)
                .frame(width: 300)
                .lineSpacing(5)

                .multilineTextAlignment(.center)

            Text("Select atleast one emotion.")
                .multilineTextAlignment(.center)
                .appFont(type: .subText2)
                .lineSpacing(5)
                .foregroundStyle(Color.gray)
                .frame(width: 250)
        }
    }
}


#Preview {
    SelectEmotionsView()
}
