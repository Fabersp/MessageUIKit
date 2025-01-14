//
//  MessageUIKitApp.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/8/25.
//

import SwiftUI

@main
struct MessageUIKitApp: App {
    @StateObject private var appTheme = AppThemeManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appTheme)
        }
    }
}
