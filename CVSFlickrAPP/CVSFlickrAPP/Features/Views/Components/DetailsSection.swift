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
            if let title = image.title, !title.isEmpty {
                Text(title)
                    .font(.title)
            } else {
                Text(UIStrings.titleNotAvailable.rawValue)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            
            if  let description =  image.description, !description.isEmpty {
                Text(getAttributedString(from: description))
                    .font(.body)
            } else {
                Text(UIStrings.descriptionNotAvailable.rawValue)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            Text("Author: \(cleanName(image.author ?? ""))")
                .font(.subheadline)
            
            Text("Published: \(image.formattedDate)")
                .font(.caption)
        }
        .padding()
    }
}
