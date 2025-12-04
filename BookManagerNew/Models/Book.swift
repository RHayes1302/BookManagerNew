//
//  Book.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 11/28/25.
//

import Foundation

struct Book: Identifiable, Codable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var coverImage: String = "default_book"

    var details: String

    var review: String = ""
    var status: ReadingStatus = .unknown
    var rating: Int = 0

    // Uses your Genre enum
    var genre: Genre = .unknown
}

