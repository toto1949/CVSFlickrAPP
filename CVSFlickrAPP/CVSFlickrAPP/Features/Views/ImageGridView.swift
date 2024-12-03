//
//  ImageGridView.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import SwiftUI

struct ImageGridView: View {
    let images: [FlickrImage]
    
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 2)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(images) { image in
                    NavigationLink(destination: ImageDetailView(image: image)) {
                        ImageCell(imageUrl: image.imageUrl)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 2)
        }
    }
}
