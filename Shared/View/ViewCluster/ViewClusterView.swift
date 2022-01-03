//
//  ViewClusterView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/30/21.
//

import SwiftUI

struct ViewClusterView: View {
    @StateObject var viewModel = ViewClusterViewModel(cluster: MockData.cluster1)
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
                Button {
                    print("pressed add")
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .tint(.primary)
                        .padding(.horizontal)

                }
                }
            }
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(viewModel.cluster.buckets) { bucket in
                    BucketPreviewView(bucket: bucket)
                }
            }
            Spacer()
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
