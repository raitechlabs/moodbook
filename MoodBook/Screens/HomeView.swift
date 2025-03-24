//
//  ContentView.swift
//  MoodBook
//
//  Created by Keshu Rai on 09/02/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var selectedOption: SelectedFooterOption = .home
    @State private var showAddMoodSheet: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundStyle(.clear)
                .appGradient(.gradient1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack {
                    Text("Hey, Keshu! 👋")
                        .appFont(type: .heading2)
                    Spacer()
                    CurrentDateView()
                    HStack {
                        Text("🔥 5")
                            .appFont(type: .heading2)
                      
                    }
                    .frame(height: 40)
                    .padding(.horizontal,8)
                    .background(Color.white)
                    .clipShape(Capsule())
                    //cards
                  
                }
                .padding(.horizontal,20)
                Spacer()

                ScrollView {
                    ForEach(1...10, id: \.self) { index in
                        MoodRecordCard()
                       
                    }
                }
               
                FooterBar(selectedOption: $selectedOption)
             
            }
            
        }
        .onChange(of: selectedOption) { oldValue, newValue in
            switch selectedOption {
            case .home:
                print("home")
            case .stats:
                print("stats")
            case .addMood:
                showAddMoodSheet.toggle()
            case .history:
                print("history")

            case .settings:
                print("settings")

            }
        }
        .sheet(isPresented: $showAddMoodSheet) {
            AddMoodView()
        }
        .onChange(of: showAddMoodSheet) { oldValue, newValue in
            selectedOption = .home
        }
   
    }
    

}

#Preview {
    HomeView()
}

