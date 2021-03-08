//
//  NavigationBuilder.swift
//  Grocery Store
//
//  Created by Enrique Miguel Bonilla Untiveros on 3/4/21.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)
class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        
        let textStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)!
        ]
        
        let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.init(name: "AvenirNext-DemiBold", size: 28.0)!
        ]
        
        let navigationController = UINavigationController(rootViewController: rootView)
//        navigationController.navigationBar.barTintColor = UIColor.primary
//        navigationController.navigationBar.tintColor = UIColor.white
//        navigationController.navigationBar.titleTextAttributes = textStyleAttributes
//        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor.primary
        navBarAppearance.titleTextAttributes = textStyleAttributes
        navBarAppearance.largeTitleTextAttributes = largeTextStyleAttributes
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        return navigationController
    }
}
