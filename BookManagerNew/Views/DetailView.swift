//
//  DetailView.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 11/28/25.
//
import SwiftUI

struct DetailView: View {
    
    
    @Binding var book: Book
    
    @State private var showEditBookSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack(alignment: .top) {
                    
                    
                    if UIImage(named: book.coverImage) != nil {
                        Image(book.coverImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                    } else {
                        Image(systemName: "book.closed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(book.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("by \(book.author)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                       
                        HStack {
                            ForEach(1...5, id: \.self) { star in
                                Image(systemName: star <= book.rating ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
               
                DescriptionView(text: book.details)
                    .padding(.horizontal)
                
                Divider()
                
               
                VStack(alignment: .leading, spacing: 10) {
                    Text("My Review")
                        .font(.headline)
                    
                    if book.review.isEmpty {
                        Text("No review yet.")
                            .italic()
                            .foregroundColor(.gray)
                    } else {
                        Text(book.review)
                            .font(.body)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
             
                showEditBookSheet.toggle()
            }
        }
        .sheet(isPresented: $showEditBookSheet) {
            AddEditView(bookToEdit: $book)
        }
    }
}

