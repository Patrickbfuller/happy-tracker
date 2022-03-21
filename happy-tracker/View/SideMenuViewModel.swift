//
//  SideMenuViewModel.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//

import Foundation
import IOSurface

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case userSettings
    case logout
    
    var menuOption: String {
        switch self {
        case .profile: return "Profile"
        case .userSettings: return "App Settings"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .userSettings: return "gear"
        case .logout: return "arrow.left.square"
        }
    }
}
