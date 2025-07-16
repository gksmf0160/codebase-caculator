//
//  AppDelegate.swift
//  codebase-caculator
//
//  Created by 송명균 on 6/23/25.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController() // 시작할 VC 설정
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

