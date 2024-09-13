//
//  WeekEntity.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

public enum Week: String, CaseIterable, Identifiable {
    public var id: String {
        self.rawValue
    }
    
    case mon = "MONDAY"
    case tue = "TUESDAY"
    case wed = "WEDNESDAY"
    case thur = "THURSDAY"
    case fri = "FRIDAY"
    case sat = "SATURDAY"
    case sun = "SUNDAY"
    
    public var title: String {
        switch self {
        case .mon:
            "월"
        case .tue:
            "화"
        case .wed:
            "수"
        case .thur:
            "목"
        case .fri:
            "금"
        case .sat:
            "토"
        case .sun:
            "일"
        }
    }
}
