//
//  Item.swift
//  DailyEmotion_iOS
//
//  Created by Yohan Yoon on 5/22/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var emotion: String
    
    init(timestamp: Date, emotion: String) {
        self.timestamp = timestamp
        self.emotion = emotion
    }
}
