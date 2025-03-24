//
//  CurrentDateView.swift
//  MoodBook
//
//  Created by Keshu Rai on 24/03/25.
//
import SwiftUI

struct CurrentDateView: View {
    var body: some View {
        HStack {
            Text("Sun, 23 March")
                .appFont(type: .subText2)
            Image(uiImage: UIImage.calendar)
                .resizable()
                .renderingMode(.template)
                .frame(width: 20,height: 20)
                .appColor(ui: .primary1)
        }.frame(height: 40)
            .padding(.horizontal,8)
            .background(Color.white)
            .clipShape(Capsule())
    }
}
