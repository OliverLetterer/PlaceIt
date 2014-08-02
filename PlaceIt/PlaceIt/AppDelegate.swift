//
//  AppDelegate.swift
//  PlaceIt
//
//  Created by Oliver Letterer on 02.08.14.
//  Copyright (c) 2014 Sparrow-Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow!

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = UINavigationController(rootViewController: ViewController())

        window.makeKeyAndVisible()
        return true
    }
}

