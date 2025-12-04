//
//  ReadingStatus.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 12/2/25.
//

//This is an enum that will be used to determine all possible reading status
   

import Foundation

enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case plantoread = "plan_to_read"
    case reading = "reading"
    case dropped = "dropped"
    case finished = "finished"
    case unknown = "unknown"

    var displayName: String {
        switch self {
        case .plantoread: return "Plan to Read"
        case .reading: return "Reading"
        case .dropped: return "Dropped"
        case .finished: return "Finished"
        case .unknown: return "Unknown"
        }
    }
}
