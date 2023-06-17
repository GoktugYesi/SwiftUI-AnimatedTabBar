//
//  Tab.swift
//  AnimatedTabBar
//
//  Created by Göktug Yeşil on 17.06.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case anasayfa = "Anasayfa"
    case mail = "Mail"
    case izinler = "İzinler"
    case ayarlar = "Ayarlar"
    
    var systemImage: String {
        switch self {
        case .anasayfa:
            return "house"
        case .mail:
            return "envelope.open.badge.clock"
        case .izinler:
            return "hand.raised"
        case .ayarlar:
            return "gear"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}


