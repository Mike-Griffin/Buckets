//
//  String+Ext.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/31/21.
//

import Foundation

extension String {
    func pluralize(_ count: Int) -> String {
        return count == 1 ? "\(count) \(self)" : "\(count) \(self)s"
    }
}
