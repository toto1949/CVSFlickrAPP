//
//  Endpoints.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import Foundation

enum Endpoint {
    case searchImages(tags: String)
    
    var url: URL? {
        switch self {
        case .searchImages(let tags):
            let encodedTags = tags.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return URL(string: "\(Constants.API.baseURL)?format=json&nojsoncallback=1&tags=\(encodedTags)")
        }
    }
}
