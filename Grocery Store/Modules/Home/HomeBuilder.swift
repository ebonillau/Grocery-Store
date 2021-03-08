//
//  HomeBuilder.swift
//  CleanSample
//
//  Created by Enrique Bonilla on 17/02/21.
//

import UIKit

class HomeBuilder {
    
    static func build(usingNavigationController factory: NavigationFactory) -> UINavigationController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        view.title = "Fresh Groceries"
        let router = HomeRouter(viewController: view)
        let interactor = HomeInteractor(service: StubService.shared)
        view.presenter = HomePresenter(view: view, router: router, interactor:  interactor)
        return factory(view)
    }
}
