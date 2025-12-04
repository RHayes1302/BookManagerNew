//
//  BookLinkItem.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 11/28/25.
//

import SwiftUI

struct BookLinkItem: View {
    
    var book: Book
    
    var body: some View {
        HStack {
            
            
            if UIImage(named: book.coverImage) != nil {
                Image(book.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 75)
                    .cornerRadius(5)
            } else {
                Image(systemName: "book.closed.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 75)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
