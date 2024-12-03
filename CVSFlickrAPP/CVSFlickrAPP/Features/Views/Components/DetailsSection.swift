//
//  DetailsSection.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/3/24.
//

import SwiftUI

struct DetailsSection: View {
    let image: FlickrImage
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        VStack(alignment: sizeClass == .compact ? .center : .leading, spacing: 8) {
            if !image.title.isEmpty {
                Text(image.title)
                    .font(.title)
            } else {
                Text("Title not available.")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            
            if !image.description.isEmpty {
                Text(getAttributedString(from: image.description))
                    .font(.body)
            } else {
                Text("Description not available.")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            Text("Author: \(cleanName(image.author))")
                .font(.subheadline)
            
            Text("Published: \(image.formattedDate)")
                .font(.caption)
        }
        .padding()
    }
}
