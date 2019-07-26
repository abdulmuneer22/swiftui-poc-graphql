//
//  AppDelegate.swift
//  synup-poc
//
//  Created by synup on 12/07/19.
//  Copyright © 2019 synup. All rights reserved.
//

import UIKit
import Apollo


let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    // Add additional headers as needed
    configuration.httpAdditionalHeaders = ["Authorization": "API ZZmVKpGPe25ZXYF3U_0eQYUXSh0"]
    
    let url = URL(string: "http://sandbox-lb3.env.synup.com/graphql")!
    
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

