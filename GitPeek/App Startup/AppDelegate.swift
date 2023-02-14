//
//  AppDelegate.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var applicationRouter: ApplicationRootRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        makeRoot()
        return true
    }
    
    private func makeRoot() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let router = ApplicationRootRouter(window: window)
        router.root()
        self.window = window
        self.applicationRouter = router
    }
}

