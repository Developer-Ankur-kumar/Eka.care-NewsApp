//
//  Category.swift
//  Eka.care-NewsApp
//
//  Created by Ankur Kumar on 14/03/25.
//

import Foundation


enum Category: String, CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
}

extension Category {
    var localizedDescription: String {
        switch self {
        case .general:
            return NSLocalizedString("Top Headlines", comment: "")
        case .business:
            return NSLocalizedString("Business", comment: "")
        case .entertainment:
            return NSLocalizedString("Entertainment", comment: "")
        case .health:
            return NSLocalizedString("Health", comment: "")
        case .science:
            return NSLocalizedString("Science", comment: "")
        case .sports:
            return NSLocalizedString("Sports", comment: "")
        case .technology:
            return NSLocalizedString("Technology", comment: "")
        }
    }
}
