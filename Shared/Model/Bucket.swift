//
//  Bucket.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation
import SwiftUI

enum Colors: String, Equatable, CaseIterable {
    case red
    case green
    case blue
    case yellow
    case teal
    
    var colorValue: Color {
        switch(self) {
            
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .teal:
            return .teal
        }
    }
}

struct Bucket: Identifiable, Codable {
    let id = UUID()
    let name: String
    var ideas: [Idea]
    let color: String
    
//    init(id: UUID = UUID(), name: String, ideas: [Idea], color: String) {
//        self.id = id
//        self.name = name
//        self.ideas = ideas
//        self.color = color
//    }
}

extension Bucket {
    static var emptyBucket = Bucket(name: "No Bucket", ideas: [], color: DefaultValues.defaultColors)
}

extension Bucket {
    var colorValue: Color {
        switch(Colors(rawValue: color)) {
        case .none:
            return .white
        case .some(let color):
            switch color {
            case .red:
                return .red
            case .green:
                return .green
            case .blue:
                return .blue
            case .yellow:
                return .yellow
            case .teal:
                return .teal
            }
        }
    }
}
