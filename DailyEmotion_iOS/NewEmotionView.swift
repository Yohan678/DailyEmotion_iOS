//
//  NewEmotionView.swift
//  DailyEmotion_iOS
//
//  Created by Yohan Yoon on 5/22/26.
//

import SwiftUI
import SwiftData

struct NewEmotionView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    private let emotionEmojis: [String] = ["🙂", "☺️", "😒", "😠"]
    
    //showing 'state' of what is chosen among the buttons in the ForEach Loop
    @State var selectedEmoji: String? = nil
    @State var todaysNote: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                HStack {
                    ForEach(emotionEmojis, id: \.self) { emoji in
                        Button {
                            selectedEmoji = selectedEmoji == emoji ? nil : emoji
                        } label: {
                            Text(emoji)
                                .font(.system(size: 50))
                                .scaleEffect(selectedEmoji == emoji ? 1.5 : 1.0)
                                .opacity(selectedEmoji == emoji ? 1.0 : 0.5)
                                .padding()
                        }
                    }
                }
                
                TextEditor(text: $todaysNote)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 300)
                    .background(
                        RoundedRectangle(cornerRadius: 22)
                            .fill(.gray.opacity(0.2))
                    )
                    .padding()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addItem()
                    }
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), emotion: selectedEmoji ?? "😶", text: todaysNote)
            modelContext.insert(newItem)
            
            dismiss()
        }
    }
}

#Preview {
    NewEmotionView()
}
