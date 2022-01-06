//
//  Bucket.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/29/21.
//

import Foundation
import SwiftUI

private enum Colors: String {
    case red
    case green
    case blue
    case yellow
}

struct Bucket: Identifiable {
    let id = UUID()
    let name: String
    var ideas: [Idea]
    let color: String

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
            }
        }
    }
}
