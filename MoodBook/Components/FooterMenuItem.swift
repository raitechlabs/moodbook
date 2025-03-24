//
//  FooterMenuItem.swift
//  MoodBook
//
//  Created by Keshu Rai on 23/03/25.
//

import SwiftUI

struct FooterMenuItem: View {
    
    let image : UIImage
    let heading : String
    let isBig : Bool
    let tintColor : Color?
    let onTapGesture : () -> Void
    
    init(image: UIImage, heading: String, isBig: Bool = false, tintColor: Color? = nil, onTapGesture : @escaping () -> Void) {
        self.image = image
        self.heading = heading
        self.isBig = isBig
        self.tintColor = tintColor
        self.onTapGesture = onTapGesture
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .renderingMode(.template)
                .frame(width: isBig ? 50 : 20,height: isBig ? 50 : 20)
                .foregroundStyle(tintColor ?? .primary)
                
            Text(heading)
                .appFont(type: .subText3)
        }.onTapGesture {
            onTapGesture()
        }
        
    }
}

#Preview {
    FooterMenuItem(image : UIImage.home, heading: "Home", isBig: false, tintColor: Color.red, onTapGesture: {})
}
