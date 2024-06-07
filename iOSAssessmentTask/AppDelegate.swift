//
//  AppDelegate.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = Realm.Configuration(
            schemaVersion: 2, // Increment this number whenever you make a change to the schema
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 2 {
                    migration.enumerateObjects(ofType: RealmUniversityList.className()) { oldObject, newObject in
                        // Initialize new properties with empty lists if they did not exist before
                        if newObject!["webPages"] == nil {
                            newObject!["webPages"] = List<String>()
                        }
                        if newObject!["domains"] == nil {
                            newObject!["domains"] = List<String>()
                        }
                    }
                }
                // Add more migration blocks as needed for future schema versions
            }
        )

        Realm.Configuration.defaultConfiguration = config

        do {
            let realm = try Realm()
            // Your Realm database is now migrated and ready to use
        } catch let error {
            print("Error opening Realm: \(error.localizedDescription)")
        }

        let getList = GetListWireFrame.createGetListModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = getList
        window?.makeKeyAndVisible()

        
        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

