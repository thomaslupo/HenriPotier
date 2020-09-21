//
//  AppDelegate.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import UIKit
import Swinject
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let disposeBag = DisposeBag()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setNavigationBarAppearance()

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let navigator = Assembler.sharedAssembler.resolver.resolve(BooksNavigator.self)!
        navigator.start()

        window.makeKeyAndVisible()

        return true
    }

    func setNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()

        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]

        appearance.buttonAppearance = buttonAppearance

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.black
    }
}

