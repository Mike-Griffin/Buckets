//
//  NetworkManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/24/22.
//

import Foundation

protocol NetworkManager {
    func getClusters() -> [Cluster]
}
