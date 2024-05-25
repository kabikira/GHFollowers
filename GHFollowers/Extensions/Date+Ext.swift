//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/13.
//

import Foundation

extension Date {

    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
