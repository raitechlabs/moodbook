//
//  Item.swift
//  MoodBook
//
//  Created by Keshu Rai on 09/02/25.
//

import Foundation
import SwiftData

@Model
class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
