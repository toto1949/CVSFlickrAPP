//
//  NetworkManager.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import Foundation

final class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return URLSession(configuration: config)
    }(), jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }
    
    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.serverError("Invalid response")
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Invalid response with status code: \(httpResponse.statusCode)")
        }
        
        
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            Logger.log(error: error, additionalInfo: "Failed to decode data for URL: \(url.absoluteString)")
            throw NetworkError.decodingError
        }
    }
}

