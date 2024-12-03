//
//  ContentView.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FlickrViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                SearchBar(text: $searchText)
                    .onChange(of: searchText) { newValue in
                        Task {
                            await viewModel.search(for: newValue)
                        }
                    }
                
                if viewModel.isLoading {
                    LoadingView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ImageGridView(images: viewModel.images)
                }
            }
            .navigationTitle("Flickr Search")
        }
    }
}
