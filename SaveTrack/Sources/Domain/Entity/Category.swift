//
//  Category.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import Foundation

public struct Category: Identifiable {
    public var title: String
    public var id: String
    
    init(title: String, id: String) {
        self.title = title
        self.id = id
    }
}

public enum CategoryCase: String, CaseIterable, Identifiable {
    
    public var id: String {
        self.rawValue
    }
    
    case electric = "category-001"
    case money = "category-002"
    case time = "category-003"
    
    var toCategory: Category {
        return .init(title: title,
                     id: id)
    }
    
    var title: String {
        switch self {
        case .electric:
            "전기 절약"
        case .money:
            "돈 절약"
        case .time:
            "시간 절약"
        }
    }
    
    var imageName: String {
        switch self {
        case .electric:
            SaveTrackAsset.Assets.electric.name
        case .money:
            SaveTrackAsset.Assets.money.name
        case .time:
            SaveTrackAsset.Assets.time.name
        }
    }
}
