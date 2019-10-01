//
//  AppDelegate.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
    var navController: UINavigationController?
    var listActorsView: ListActorsViewController?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNetworking()
        window = UIWindow(frame:UIScreen.main.bounds)
        listActorsView = ListActorsViewController(nibName: "ListActorsViewController", bundle: nil)
        navController = UINavigationController(rootViewController: listActorsView!)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
	}


}

