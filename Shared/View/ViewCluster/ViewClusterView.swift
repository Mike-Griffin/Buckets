//
//  ViewClusterView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import SwiftUI

struct ViewClusterView: View {
    @StateObject var viewModel = ViewClusterViewModel(clusterManager: MockBucketDataManager(), cluster: MockData.cluster1)
    var body: some View {
        let columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
        
        VStack {
            ZStack {
                Text(viewModel.cluster.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    Menu {
                        Button("Create Bucket") {
                            viewModel.showNewBucketForm = true
                        }
                        Button("Create Idea") {
                            print("do it idea version")
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .tint(.primary)
                            .padding(.horizontal)
                        
                    }
                }
            }
            ZStack {
                VStack {
                    Spacer()
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.cluster.buckets) { bucket in
                            BucketPreviewView(bucket: bucket)
                        }
                    }
                    Spacer()
                }
                if viewModel.showNewBucketForm {
                    VStack {
                        Text("Create Bucket")
                        TextField("Name", text: $viewModel.bucketName)
                        Button {
                            viewModel.createBucket(name: viewModel.bucketName)
                            viewModel.showNewBucketForm = false
                        } label: {
                            Text("Save")
                        }

                    }
                    .frame(width: 300, height: 300)
                    .background(.white)
                }
            }
        }
        //        .navigationTitle(viewModel.cluster.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ViewClusterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewClusterView()
    }
}
