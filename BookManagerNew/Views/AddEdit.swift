//
//  AddEdit.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 12/2/25.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var bookToEdit: Book
    @State private var workingBook: Book
    @Environment(\.dismiss) var dismiss
    
    var titleText: String {
        workingBook.title.isEmpty ? "Add Book" : "Edit Book"
    }
    
    init(bookToEdit: Binding<Book>) {
        let initialBook = bookToEdit.wrappedValue
        self._workingBook = State(initialValue: initialBook)
        self._bookToEdit = bookToEdit
    }
    
    var body: some View {
        NavigationStack {
            Form {
                bookDetailsSection
                detailsTextEditor
                bookReviewSection
            }
            .navigationTitle(titleText)
            .toolbar {
                
                // Save Button
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        bookToEdit = workingBook
                        dismiss()
                    }
                    .disabled(workingBook.title.isEmpty)
                }
                
                // Cancel Button
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Book Details Section
    
    private var bookDetailsSection: some View {
        Section(header: Text("Book Details")) {
            TextField("Title", text: $workingBook.title)
            TextField("Author", text: $workingBook.author)
            
            Picker("Genre", selection: $workingBook.genre) {
                ForEach(Genre.allCases, id: \.self) { genre in
                    Text(genre.displayName).tag(genre)
                }
            }
        }
    }
    
    // MARK: - Description Section
    
    private var detailsTextEditor: some View {
        Section(header: Text("Description")) {
            TextEditor(text: $workingBook.details)
                .frame(height: 150)
        }
    }
    
    // MARK: - Review + Rating Section
    
    private var bookReviewSection: some View {
        Section(header: Text("Review")) {
            
            // Rating Picker
            Picker("Rating", selection: $workingBook.rating) {
                Group {
                    Text("No Rating").tag(0)
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
            }
            
            // Reading Status Picker
            Picker("Reading Status", selection: $workingBook.status) {
                ForEach(ReadingStatus.allCases, id: \.self) { status in
                    Text(status.displayName).tag(status)
                }
            }
            
            TextEditor(text: $workingBook.review)
                .frame(height: 150)
        }
    }
}
