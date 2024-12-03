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
                ImageSection(image: image)
                DetailsSection(image: image)
            }
            .padding()
        }
        
        .navigationBarItems(trailing: ShareLink(item: image.link ?? ""))
    }
}
