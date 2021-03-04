//
//  Interactor.swift
//  CleanSample
//
//  Created by Enrique Bonilla on 17/02/21.
//

import Foundation

protocol HomeUseCase {
    func getGroceries(completion: GroceriesClousure) -> ()
}

class HomeInteractor {
    var service: GroceriesAPI
    
    init(service: GroceriesAPI) {
        self.service = service
    }
}

extension HomeInteractor: HomeUseCase {
    
    func getGroceries(completion: (GroceryResult) -> ()) {
        self.service.fetchGroceries { (result) in
            completion(result)
        }
    }

    
}
