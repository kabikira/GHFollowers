//
//  String+Ext.swift
//  GHFollowers
//
//  Created by koala panda on 2024/05/13.
//

import Foundation

extension String {

    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current

        return dateFormatter.date(from: self)
    }

    
    // 日付を返せなかった時の、デフォルト値がある
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "K/A" }
        return date.convertToMonthYearFormat()
    }
}
