//
//  Logger.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/2/24.
//

import Foundation

enum Logger {
    static func log(error: Error) {
        #if DEBUG
        print("Error: \(error.localizedDescription)")
        #endif
    }
}
