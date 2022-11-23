//
//  SceneDelegate.swift
//  ENG-SOFTWARE-APP
//
//  Created by Daniel Gomes Xavier on 22/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)

        let presenter = Presenter()
        let viewController = ViewController(presenter: presenter)
        presenter.attach(view: viewController)
        
        let navigationController = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}

