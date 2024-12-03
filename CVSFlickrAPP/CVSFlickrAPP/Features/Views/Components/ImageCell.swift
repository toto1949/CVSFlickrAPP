//
//  ImageCell.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import SwiftUI

struct ImageCell: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 100, height: 100)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
            case .failure:
                Image(systemName: "photo")
                    .frame(width: 100, height: 100)
            @unknown default:
                EmptyView()
                    .frame(width: 100, height: 100) 
            }
        }
        .frame(width: 100, height: 100)
        .background(Color.gray.opacity(0.1))
    }
}
