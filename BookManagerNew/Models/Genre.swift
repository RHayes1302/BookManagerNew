//
//  Genre.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 12/2/25.
//

import Foundation

enum Genre: String, CaseIterable, Hashable, Codable {
    case classic
    case fantasy
    case scienceFiction
    case mystery
    case romance

    // Base case
    case unknown

    var displayName: String {
        switch self {
        case .classic: return "Classic"
        case .fantasy: return "Fantasy"
        case .scienceFiction: return "Science Fiction"
        case .mystery: return "Mystery"
        case .romance: return "Romance"
        case .unknown: return "Unknown"
        }
    }
}

