//
//  NetworkManaging.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import Foundation
protocol NetworkManaging {
    func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T
}
