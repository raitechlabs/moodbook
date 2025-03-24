//
//  MoodRecordCard.swift
//  MoodBook
//
//  Created by Keshu Rai on 11/02/25.
//

import SwiftUI

struct MoodRecordCard: View {
    
    @State var isReadMoreEnabled : Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                HStack {
                    Image(uiImage: UIImage.poutingFace)
                        .resizable()
                        .frame(width: 50,height: 50)
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Terrible")
                            .appFont(type: .heading2)
                        Text("20:10")
                            .appFont(type: .subText3)
                    }
                }
                Spacer()
                HStack {
                    Text("Delete")
                        .appFont(type: .heading3)
                        .appColor(text: .red)
                    Text("Edit")
                        .appFont(type: .heading3)
                        .appColor(ui: .primary1)

                }
            }
            HStack(spacing: 2) {
                Text("You Felt").appFont(type: .subText2)
                Text("Disappointed, Confused").appFont(type: .heading3)
            }
            HStack(spacing: 2) {
                Text("Because of").appFont(type: .subText2)
                Text("Work").appFont(type: .heading3)
            }
            Text("The day didnt go well in the monring, i wanted to go to gym but my sister kept giving me reasons why i cant go. I really felt frustrated.")
                .appFont(type: .subText2)
                .lineLimit(isReadMoreEnabled ? nil : 2)
                .lineSpacing(5.0)
            Text(isReadMoreEnabled ? "- Read Less" : "+ Read More")
                .appColor(ui: .primary1)
                .appFont(type: .subText2)
                .onTapGesture {
                    isReadMoreEnabled = !isReadMoreEnabled
                }
           
        }
        .padding(10)
        .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray,lineWidth: 0.5)
        }
        .padding(10)
       
    }
}

#Preview {
    MoodRecordCard()
}
