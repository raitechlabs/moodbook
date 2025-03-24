//
//  SelectMoodView.swift
//  MoodBook
//
//  Created by Keshu Rai on 25/03/25.
//

import SwiftUI

struct SelectMoodView: View {
    
    let moods: [Mood] = [
        Mood(image: .poutingFace, title: "Angry"),
        Mood(image: .disappointedFace, title: "Disappointed"),
        Mood(image: .neutralFace, title: "Neutral"),
        Mood(image: .smilingFaceWithHalo, title: "Happy"),
        Mood(image: .starStruck, title: "Awesome")
    ]
    
    @State private var selectedMoodIndex: Int = 2 // Default to center mood
    @Namespace private var scrollNamespace
    
    var body: some View {
        VStack(spacing: 15) {
            Text("What's your mood now?")
                .appFont(type: .heading2)
                .frame(width: 250)

            Text("Select mood that reflects the most how you are feeling at this moment.")
                .multilineTextAlignment(.center)
                .appFont(type: .subText2)
                .lineSpacing(5)
                .foregroundStyle(Color.gray)
                .frame(width: 250)
            
            Spacer()
            
            ZStack {
                Image(uiImage: .scroller)
                             .resizable()
                             .aspectRatio(contentMode: .fill)
                             .frame(maxWidth: UIScreen.main.bounds.size.width)
                             .frame(height: 300)
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(moods.indices, id: \.self) { index in
                                VStack {
                                    Image(uiImage: moods[index].image)
                                        .resizable()
                                        .frame(width: index == selectedMoodIndex ? 120 : 60,
                                               height: index == selectedMoodIndex ? 120 : 60)
                                        .onTapGesture {
                                            withAnimation {
                                                selectedMoodIndex = index
                                                proxy.scrollTo(index, anchor: .center)
                                            }
                                        }
                                    
                                    Text(moods[index].title)
                                        .appFont(type: .subText2)
                                        .foregroundColor(index == selectedMoodIndex ? .black : .gray)
                                }
                                .id(index)
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            proxy.scrollTo(selectedMoodIndex, anchor: .center)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
