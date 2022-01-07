//
//  ViewClusterView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import SwiftUI

struct ViewClusterView: View {
    @StateObject var viewModel = ViewClusterViewModel(clusterManager: MockBucketDataManager(), cluster: MockData.cluster1)
    @State var screenWidth: CGFloat = 0
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
                        AddButtonView()
                    }
                }
            }
            ZStack {
                VStack {
                    Spacer()
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.cluster.buckets) { bucket in
                            BucketGridItemView(bucket: bucket)
                        }
                    }
                    Spacer()
                }
                if viewModel.showNewBucketForm {
                    NewBucketFormView(viewModel: viewModel, width: screenWidth)
                }
            }
        }
        .readSize { screenWidth = $0.width }
        //        .navigationTitle(viewModel.cluster.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ViewClusterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewClusterView()
    }
}


