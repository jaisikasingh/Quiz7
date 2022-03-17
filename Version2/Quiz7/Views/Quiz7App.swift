//
//  Quiz7App.swift
//  Quiz7
//
//  Created by Jaisika Singh on 2022-03-16.
//

import SwiftUI

@main
struct Quiz7App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ProductContentView()
                .environmentObject(ProductViewModel())
        }
    }
}
