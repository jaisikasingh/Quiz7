//
//  AppDelegate.swift
//  Quiz7
//
//  Created by Jaisika Singh on 2022-03-16.
//

import Foundation
import UIKit
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        configMigration()
        return true
    }

    private func configMigration() {
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
            })
        Realm.Configuration.defaultConfiguration = config
    }
}
