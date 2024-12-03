//
//  CVSFlickrAPPTests.swift
//  CVSFlickrAPPTests
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import XCTest
@testable import CVSFlickrAPP

final class CVSFlickrAPPTests: XCTestCase {
    
    class MockNetworkManager: NetworkManaging {
        var shouldReturnError = false
        var mockResponse: FlickrResponse?
        
        func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
            if shouldReturnError {
                throw NetworkError.serverError("Mock error")
            }
            guard let response = mockResponse as? T else {
                throw NetworkError.decodingError
            }
            return response
        }
    }
    
    @MainActor func testInitialization() {
        let mockNetworkManager = MockNetworkManager()
        let viewModel = FlickrViewModel(networkManager: mockNetworkManager)
        
        XCTAssertTrue(viewModel.images.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    @MainActor func testSearchSuccess() async  {
        let mockNetworkManager = MockNetworkManager()
        let mockImages = [
            FlickrImage(
                title: "A Creature from Hell?",
                link: "https://www.flickr.com/photos/60250038@N02/54161603243/",
                media: ["m": "https://live.staticflickr.com/65535/54161603243_febf6d0beb_m.jpg"],
                dateTaken: "2024-05-30T11:46:39-08:00",
                description: "Description 1",
                published: "2024-11-24T15:31:45Z",
                author: "nobody@flickr.com"
            )
        ]
        mockNetworkManager.mockResponse = FlickrResponse(items: mockImages)
        let viewModel =  FlickrViewModel(networkManager: mockNetworkManager)
        
        await viewModel.search(for: "Nature")
        
        XCTAssertEqual(viewModel.images.count, 1)
        XCTAssertEqual(viewModel.images.first?.title, "A Creature from Hell?")
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor func testSearchFailure() async {
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.shouldReturnError = true
        let viewModel = FlickrViewModel(networkManager: mockNetworkManager)
        await viewModel.search(for: "Nature")
        
        XCTAssertTrue(viewModel.images.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    @MainActor func testSearchEmptyQuery() async {
        let mockNetworkManager = MockNetworkManager()
        let viewModel = FlickrViewModel(networkManager: mockNetworkManager)
        await viewModel.search(for: "")
        
        XCTAssertTrue(viewModel.images.isEmpty)
        XCTAssertNil(viewModel.errorMessage)
    }
}
