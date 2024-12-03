//
//  NetworkError.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
}
