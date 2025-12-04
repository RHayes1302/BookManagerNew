//
//  ReviewView.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 12/2/25.
//

import SwiftUI

struct ReviewEditorView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var rating: Int
    @Binding var review: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Rating") {
                    HStack {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    rating = star
                                }
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                Section("Review") {
                    TextEditor(text: $review)
                        .frame(minHeight: 120)
                }
            }
            .navigationTitle("Edit Review")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
