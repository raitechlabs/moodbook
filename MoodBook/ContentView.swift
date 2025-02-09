//
//  ContentView.swift
//  MoodBook
//
//  Created by Keshu Rai on 09/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Text("Hello")
                .appFont(type: .heading1)
                .appGradient(.gradient1)
        

        }.onAppear{
        }
    }
    

}

#Preview {
    ContentView()
}
