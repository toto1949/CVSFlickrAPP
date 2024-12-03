//
//  Helper.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/3/24.
//

import Foundation

func cleanName(_ title: String) -> String {
    let cleanedString = title.replacingOccurrences(of: "nobody@flickr.com (\"", with: "")
        .replacingOccurrences(of: "\")", with: "")
        .replacingOccurrences(of: "(", with: "")
        .replacingOccurrences(of: ")", with: "")
        .capitalized
    return cleanedString
}

func getAttributedString(from htmlString: String) -> AttributedString {
    guard let data = htmlString.data(using: .utf8) else {
        return AttributedString(htmlString)
    }
    
    do {
        let attributedString = try NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
        return AttributedString(attributedString.string)
    } catch {
        print("Error parsing HTML: \(error)")
        return AttributedString(htmlString)
    }
}
