//
//  JSONNetworkManager.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 2/25/22.
//

import Foundation

struct JSONNetworkManager: NetworkManager {
    func getClusters() -> [Cluster] {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

        let clustersDirectory = documentDirectory.appendingPathComponent("clusters", isDirectory: true)
        if FileManager.default.fileExists(atPath: clustersDirectory.path) {
            let directoryContents = try? FileManager.default.contentsOfDirectory(atPath: clustersDirectory.path)
            var clusters: [Cluster] = []
            for file in directoryContents ?? [] {
                do {
                    let filePath = clustersDirectory.appendingPathComponent(file).path
                    let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                    let decodedFile = try JSONDecoder().decode(Cluster.self, from: data)
                    clusters.append(decodedFile)
                } catch {
                    print(error)
                }
            }
            return clusters
        } else {
            print("clusters directory does not exist")
            // read from the main bundle and write it to the clusters directory
            if let path = Bundle.main.path(forResource: "clusters", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    let decodedClusters = try JSONDecoder().decode([Cluster].self, from: data)
                    try FileManager.default.createDirectory(at: clustersDirectory, withIntermediateDirectories: false, attributes: nil)
                    for cluster in decodedClusters {
                        try FileManager.default.createFile(atPath: clustersDirectory.appendingPathComponent(cluster.id.uuidString).path, contents: JSONEncoder().encode(cluster), attributes: nil)
                    }
                    return decodedClusters
                }
                catch {
                    print(error)
                }
                print(path)
            } else {
                print("error getting the path")
            }
        }
        return []
    }
    
    func saveCluster(cluster: Cluster) {
        // create a new file with this cluster's id for a name
        print(cluster.id)
        let documentDirectoryUrl = try! FileManager.default.url(
            for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true
        )
        let clusterDirectoryUrl = documentDirectoryUrl.appendingPathComponent("clusters")
        let newFilePathUrl = clusterDirectoryUrl.appendingPathComponent(cluster.id.uuidString)
        print(newFilePathUrl)
        // TODO: Figure out how I can modify the specific part of the file
        // instead of removing the file and writing it again
        if(FileManager.default.fileExists(atPath: newFilePathUrl.path)) {
            do {
                try FileManager.default.removeItem(at: newFilePathUrl)
            } catch {
                print(error)
            }
        }
        do {
            try FileManager.default.createFile(atPath: newFilePathUrl.path, contents: JSONEncoder().encode(cluster), attributes: nil)
        } catch {
            print(error)
        }
    }
}
