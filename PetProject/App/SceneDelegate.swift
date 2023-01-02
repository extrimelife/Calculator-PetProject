//
//  SceneDelegate.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        let calculatorView = CalculatorViewController()
        let navigationView = UINavigationController(rootViewController: calculatorView)
        let window = UIWindow(windowScene: windowsScene)
        
        window.rootViewController = navigationView
        self.window = window
        window.makeKeyAndVisible()
    }
}

