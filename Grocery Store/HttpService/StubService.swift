//
//  HttpService.swift
//  Sample 2
//
//  Created by Enrique Miguel Bonilla Untiveros on 3/4/21.
//

import Foundation

typealias GroceriesClousure = (GroceryResult) -> ()
protocol GroceriesAPI {
    func fetchGroceries(completion: GroceriesClousure) -> ()
    
}

class StubService {
    static let shared: StubService = StubService()
    private init () {}
}

extension StubService: GroceriesAPI {
    
    func fetchGroceries(completion: GroceriesClousure) {
        
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(GroceryResult.self, from: data)
                completion(groceryResult)
            } catch {
                print(error)
            }
        }
    }
    
    
}
