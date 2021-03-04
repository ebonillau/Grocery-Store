//
//  HomePresenter.swift
//  CleanSample
//
//  Created by Enrique Bonilla on 17/02/21.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad() -> ()
}

class HomePresenter {
    weak var view: HomeView?
    var router: HomeRouting?
    var interactor: HomeUseCase?
    
    init(view: HomeView, router: HomeRouting, interactor: HomeUseCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresentation {
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor?.getGroceries(completion: { (result) in
                let groceryList = result.groceries.compactMap ({ GroceryItemViewModel(using: $0) })
                DispatchQueue.main.async {
                    self?.view?.updateGroceries(groceriesList: groceryList)
                }
            })
        }
    }
    
}

struct GroceryItemViewModel {
    
    let title: String
    let details: String
    let image: String
    let price: String
    
    init(using groceryModel: Grocery) {
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image
        self.price = "$ \(groceryModel.price)"
    }
    
}
