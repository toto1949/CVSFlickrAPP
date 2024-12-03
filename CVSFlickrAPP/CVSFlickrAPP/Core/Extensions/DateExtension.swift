//
//  DateExtension.swift
//  CVSFlickrAPP
//
//  Created by Taooufiq El moutaoouakil on 12/3/24.
//

import Foundation
extension Date {
    static func formatted(from dateString: String, inputFormat: String, outputStyle: DateFormatter.Style) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        dateFormatter.dateStyle = outputStyle
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
