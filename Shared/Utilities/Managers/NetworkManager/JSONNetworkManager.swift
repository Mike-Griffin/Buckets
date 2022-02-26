//
//  JSONNetworkManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/25/22.
//

import Foundation

struct JSONNetworkManager: NetworkManager {
    func getClusters() -> [Cluster] {
        if let path = Bundle.main.path(forResource: "clusters", ofType: "json") {
            do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decodedData = try JSONDecoder().decode([Cluster].self, from: data)
                return decodedData
            }
            catch {
                print(error.localizedDescription)
            }
            print(path)
        } else {
            print("error getting the path")
        }
        return []
    }
}
