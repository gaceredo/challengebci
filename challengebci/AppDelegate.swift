//
//  AppDelegate.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        setUpRealm()
        return true
    }

    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.setBackIndicatorImage(UIImage(named: "back-arrow-new"),
                                         transitionMaskImage: UIImage(named: "back-arrow-new"))
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

}

/// Set up Realm default configuration.
extension AppDelegate {
    
    private func setUpRealm() {
        let nukeDBSchemaVersion: UInt64 = RealmMigration().nukeDBSchemaVersion

        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
        do {
            let version = try schemaVersionAtURL(realmURL)
            if version < nukeDBSchemaVersion {
                deleteRealmFile(realmURL: realmURL)
            }
        } catch {}

        Realm.Configuration.defaultConfiguration = RealmMigration().configuration
    }
    
    private func deleteRealmFile(realmURL: URL) {
        let realmURLs = [realmURL]

        for URL in realmURLs {
            do {
                try FileManager.default.removeItem(at: URL)
            } catch {
                print(error)
            }
        }
    }
}
