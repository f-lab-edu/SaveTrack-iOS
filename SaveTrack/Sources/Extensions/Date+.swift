//
//  Date+.swift
//  SaveTrack
//
//  Created by SUN on 9/14/24.
//

import Foundation

extension Date {
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    public init?(_ source: String, format: String, timeZone: String? = nil) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale     = Locale(identifier: "ko_KR")
        dateFormatter.timeZone   = timeZone == nil ? nil : TimeZone(abbreviation: timeZone!.uppercased())
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: source) {
            self.init(timeIntervalSince1970: date.timeIntervalSince1970)
        } else {
            return nil
        }
    }
    
    var localDate: Self {
        let timezone = TimeZone.autoupdatingCurrent
        let secondsFromGMT = timezone.secondsFromGMT(for: self)
        let localizedDate = self.addingTimeInterval(TimeInterval(secondsFromGMT))
        return localizedDate
    }
    
    public static var now: Date {
        return Self(timeIntervalSinceNow: 0.0)
    }
    
    public func toString(format: String, locale: String? = nil, timeZone: String? = nil) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale     = locale == nil ? Locale(identifier: "ko_KR") : Locale(identifier: locale!)
        dateFormatter.timeZone   = timeZone == nil ? nil : TimeZone(abbreviation: timeZone!.uppercased())
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}
