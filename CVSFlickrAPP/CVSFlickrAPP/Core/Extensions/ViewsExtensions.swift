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

