//
//  BucketPreviewView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 12/31/21.
//

import SwiftUI

struct BucketPreviewView: View {
    let bucket: Bucket
    var body: some View {
        VStack {
            Text(bucket.name)
            Text("idea".pluralize(bucket.ideas.count))
        }
        .padding()
        .background(bucket.colorValue)
    }
}

struct BucketPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        BucketPreviewView(bucket: MockData.bucket1)
    }
}
