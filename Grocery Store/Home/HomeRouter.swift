//
//  Router.swift
//  CleanSample
//
//  Created by Enrique Bonilla on 17/02/21.
//

import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouting {
    
    
}
