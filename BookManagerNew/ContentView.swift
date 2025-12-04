//
//  ContentView.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 11/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var books = getBooks()
    @State var showAddBookSheet: Bool = false
    
    
    @State var newBook = Book(title: "", author: "", details: "")
    
    var body: some View {
        NavigationStack {
            List($books) { $bookInList in
                NavigationLink(destination: DetailView(book: $bookInList)) {
                    BookLinkItem(book: bookInList)
                }
            }
            .navigationTitle("Book Manager")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        
                        newBook = Book(title: "", author: "", details: "")
                        showAddBookSheet = true
                    }
                }
            }
            .sheet(
                isPresented: $showAddBookSheet,
                onDismiss: {
         
                    if !newBook.title.isEmpty {
                        books.append(newBook)
                    }
                },
                content: {
                    AddEditView(bookToEdit: $newBook)
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
