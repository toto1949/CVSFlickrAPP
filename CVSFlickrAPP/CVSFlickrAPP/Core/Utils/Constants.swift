//
//  Constants.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import CoreFoundation

enum Constants {
    enum API {
        static let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne"
    }
    
    enum Layout {
        static let gridSpacing: CGFloat = 2
        static let minimumGridItemSize: CGFloat = 100
    }
}
enum UIStrings: String {
    case loading = "Loading..."
    case failedToLoadImage = "Failed to load image. Tap to retry."
    case titleNotAvailable = "Title not available."
    case descriptionNotAvailable = "Description not available."
    case flickrSearch = "Flickr Search"
    case searchImagesPlaceholder = "Search images..."

}

