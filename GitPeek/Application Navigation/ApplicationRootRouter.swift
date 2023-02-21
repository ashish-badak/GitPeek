//
//  ApplicationRootRouter.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import UIKit

final class ApplicationRootRouter {
    // - TODO: Define dependancies: window
    private weak var window: UIWindow?
    let rootViewController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
    }
    
    func root() {
        let module = PullRequestListModule()
        let controller = module.build()
        rootViewController.viewControllers = [controller]
        controller.title = "Closed Pull Requests"
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
