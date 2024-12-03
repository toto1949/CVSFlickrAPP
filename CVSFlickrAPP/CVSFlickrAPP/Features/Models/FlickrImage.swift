//
//  FlickrImage.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import Foundation

struct FlickrImage: Codable, Identifiable, Hashable {
    let id = UUID()
    let title: String
    let link: String
    let media: [String: String]
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, media, description, published, author
        case dateTaken = "date_taken"
    }
    
    var imageUrl: String {
        media["m"] ?? ""
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: published) {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date)
        }
        return published
    }
}

struct FlickrResponse: Codable {
    let items: [FlickrImage]
}
