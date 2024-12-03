//
//  LoadingView.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            Text(UIStrings.loading.rawValue)
                .foregroundColor(.secondary)
        }
    }
}
