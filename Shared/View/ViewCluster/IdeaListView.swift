//
//  IdeaListView.swift
//  Buckets (iOS)
//
//  Created by Mike Griffin on 1/7/22.
//

import SwiftUI

struct IdeaListView: View {
    var bucket: Bucket
    var body: some View {
            ForEach(bucket.ideas) { idea in
                IdeaListPreviewView(idea: idea, bucket: bucket)
        }
    }
}

struct IdeaListView_Previews: PreviewProvider {
    static var previews: some View {
        IdeaListView(bucket: MockData.bucket1)
    }
}
