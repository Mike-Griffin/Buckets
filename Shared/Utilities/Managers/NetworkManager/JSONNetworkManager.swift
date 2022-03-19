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
        //        print(documentDirectory)
        //        print(documentDirectory.path)
        let clustersDirectory = documentDirectory.appendingPathComponent("clusters", isDirectory: true)
        //        print(clustersDirectory)
        if FileManager.default.fileExists(atPath: clustersDirectory.path) {
            //            print("Clusters directory exists")
            let directoryContents = try? FileManager.default.contentsOfDirectory(atPath: clustersDirectory.path)
            var clusters: [Cluster] = []
            for file in directoryContents ?? [] {
                //                print(file)
                do {
                    let filePath = clustersDirectory.appendingPathComponent(file).path
                    let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                    //                let data = try? FileManager.default.contents(atPath: clustersDirectory.appendingPathComponent(file).path)
                    let decodedFile = try JSONDecoder().decode(Cluster.self, from: data)
                    clusters.append(decodedFile)
                    //                print(decodedFile)
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
        //        if let idsPath = Bundle.main.path(forResource: "ids", ofType: "json") {
        //            do {
        //                let data = try Data(contentsOf: URL(fileURLWithPath: idsPath))
        //                let clusterIds = try JSONDecoder().decode([String].self, from: data)
        //                print(clusterIds)
        //                for clusterId in clusterIds {
        //                    print(clusterId)
        //
        //                }
        //                let clusterPaths = clusterIds.compactMap({ Bundle.main.path(forResource: $0, ofType:"json")})
        //                print(clusterPaths)
        //                var clusters: [Cluster] = []
        //                for path in clusterPaths {
        //                    do {
        //                        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        //                        let cluster = try JSONDecoder().decode(Cluster.self, from: data)
        //                        clusters.append(cluster)
        //                    }
        //                    catch {
        //                        print(error.localizedDescription)
        //                    }
        //                    print(clusters)
        //                }
        //                return clusters
        //            } catch {
        //                print(error.localizedDescription)
        //            }
        //        } else {
        //            print("error getting the ids path")
        //        }
        //        let clustersPath = Bundle.main.path(forResource: nil, ofType: "json", inDirectory: "Clusters")
        //        print(clustersPath)
        //        if let folderPath = Bundle.main.path(forResource: "Clusters", ofType: "folder") {
        //            print(folderPath)
        //        } else {
        //            print("error getting the folder path")
        //        }
        //
        //        if let path = Bundle.main.path(forResource: "clusters", ofType: "json") {
        //            do {
        //            let data = try Data(contentsOf: URL(fileURLWithPath: path))
        //                let decodedData = try JSONDecoder().decode([Cluster].self, from: data)
        //                return decodedData
        //            }
        //            catch {
        //                print(error.localizedDescription)
        //            }
        //            print(path)
        //        } else {
        //            print("error getting the path")
        //        }
        return []
    }
    
    func saveCluster(cluster: Cluster) {
        // create a new file with this cluster's id for a name
        print(cluster.id)
        let documentDirectoryUrl = try! FileManager.default.url(
            for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true
        )
        let clusterDirectoryUrl = documentDirectoryUrl.appendingPathComponent("clusters")
        // prints the file path
        print("File path \(clusterDirectoryUrl.path)")
        let newFilePathUrl = clusterDirectoryUrl.appendingPathComponent(cluster.id.uuidString)
        print(newFilePathUrl)
        // TODO: Figure out how I can modify the specific part of the file
        // instead of removing the file and writing it again
        if(FileManager.default.fileExists(atPath: newFilePathUrl.path)) {
            print("yes the file is here")
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
