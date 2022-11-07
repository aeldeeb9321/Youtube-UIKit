//
//  MenuBarOptions.swift
//  YoutubeClone
//
//  Created by Ali Eldeeb on 11/6/22.
//

import UIKit

enum MenuBarOptions: Int, CaseIterable{
    
    case Home
    case Trending
    case Subscriptions
    case Profile
    
    var iconImage: UIImage{
        switch self{
        case .Home:
            return UIImage(named: "home")!
        case .Trending:
            return UIImage(named: "trending")!
        case .Subscriptions:
            return UIImage(named: "subscriptions")!
        case .Profile:
            return UIImage(named: "account")!
        }
    }
}
