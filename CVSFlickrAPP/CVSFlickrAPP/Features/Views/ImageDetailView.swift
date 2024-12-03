//
//  ImageDetailView.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: image.imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, minHeight: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                    case .failure:
                        Image(systemName: "photo")
                            .frame(maxWidth: .infinity, minHeight: 200)
                    @unknown default:
                        EmptyView()
                            .frame(maxWidth: .infinity, minHeight: 200)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    if !image.title.isEmpty {
                        Text(image.title)
                            .font(.title)
                            .accessibilityAddTraits(.isHeader)
                    }
                    
                    if !image.description.isEmpty {
                        Text(getAttributedString(from: image.description))
                            .font(.body)
                    }
                    
                    Text("Author: \(cleanName(image.author))")
                        .font(.subheadline)
                    
                    Text("Published: \(image.formattedDate)")
                        .font(.caption)
                }
                .padding()
            }
        }
        .navigationBarItems(trailing: ShareLink(item: image.link))
    }
}
