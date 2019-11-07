//
//  Date Extension.swift
//  DIDit
//
//  Created by Joshua Botts on 10/26/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}

//class DIDDateFormatter: DateFormatter {
//
//    override init() {
//        self.locale = Locale(identifier: "en_US")
//        self.dateFormat = "yyyy-MM-dd"
//    }
//
//    func didDateToString(_ date: Date) {
//    return didDateFormatter.string(from: date)
//}
//
//    func didStringToDate(_ string: String) {
//        return didDateFormatter.date(from: string)
//    }
//}
