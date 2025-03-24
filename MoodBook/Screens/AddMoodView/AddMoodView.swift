//
//  AddMoodView.swift
//  MoodBook
//
//  Created by Keshu Rai on 24/03/25.
//

import SwiftUI

enum CurrentAddMooodProgress : Int {
    case selectMood = 1,
         selectEmotions = 2,
         selectFeeling = 3,
         selectDescription = 4
}
struct AddMoodView: View {
    
    @State var currentProgress : CurrentAddMooodProgress = .selectMood
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                ZStack {
                    HStack {
                        if(currentProgress.rawValue == 1) {
                            CurrentDateView()
                        } else {
                            Image(uiImage: UIImage.back)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    withAnimation {
                                        updateCurrentProgress(increment: false)
                                    }
                                }
                        }
                        Spacer()
                        Image(uiImage: UIImage.cross)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Circle())
                    }
                    
                    .padding(.horizontal, 10)
                    .padding(.top,20)
                    
                    Text("\(currentProgress.rawValue)/4")
                        .multilineTextAlignment(.center)
                        .appFont(type: .subText1)
                        .padding(.top,20)
                    
                }
                
                switch currentProgress {
                case .selectMood:
                    SelectMoodView()
                case .selectEmotions:
                    SelectEmotionsView()
                case .selectFeeling:
                    SelectFeelingsView()
                case .selectDescription:
                    SelectDescriptionView()
                }
                
                Spacer()
                
                Button(action: {
                    updateCurrentProgress(increment: true)
                }) {
                    Text("Continue")
                        .appFont(type: .heading2)
                        .foregroundStyle(Color.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .clipShape(Capsule())
                .padding(.all, 20)
            }.background(Color.clear)
        }.background(.thinMaterial)
    }
    
    func updateCurrentProgress(increment : Bool) {
        let action = increment ? 1 : -1
        guard let updatedProgress = CurrentAddMooodProgress(rawValue: currentProgress.rawValue + action) else { return }
        currentProgress = updatedProgress
    }
    
}






#Preview {
    AddMoodView()
}
