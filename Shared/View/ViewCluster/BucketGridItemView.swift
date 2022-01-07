//
//  SwiftUIView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/7/22.
//

import SwiftUI

struct BucketGridItemView: View {
    var bucket: Bucket
    @State var showIdeas = false
    var body: some View {
        VStack {
        BucketPreviewView(bucket: bucket)
            .onTapGesture {
                showIdeas.toggle()
            }
        if showIdeas {
            IdeaListView(bucket: bucket)
        }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BucketGridItemView(bucket: MockData.bucket1)
    }
}
