//
//  ViewClusterViewModel.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import Foundation

class ViewClusterViewModel: ObservableObject {
    @Published var cluster: Cluster
    init(cluster: Cluster) {
        print("init is called with \(cluster.name)")
        self.cluster = cluster
    }
}
