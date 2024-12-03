//
//  CustomTextField.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/3/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .overlay(
                HStack {
                    if !text.isEmpty {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
                .padding(.horizontal),
                alignment: .trailing
            )
    }
}

