//
//  ViewsExtensions.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import SwiftUI

extension View {
    func errorAlert(_ error: Binding<String?>) -> some View {
        alert("Error", isPresented: .constant(error.wrappedValue != nil)) {
            Button("OK") {
                error.wrappedValue = nil
            }
        } message: {
            Text(error.wrappedValue ?? "")
        }
    }
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
