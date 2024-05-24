//
//  RogramApp.swift
//  Rogram
//
//  Created by Ovais Khan on 5/23/24.
//

import SwiftUI

@main
struct RogramApp: App {
    var body: some Scene {
        WindowGroup {
            RoHomePageView(showSplash: .constant(true), openImage: false)
                .environment(\.colorScheme, .light)
        }
    }
}
