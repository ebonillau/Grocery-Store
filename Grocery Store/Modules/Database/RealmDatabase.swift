//
//  RealDatabase.swift
//  Grocery Store
//
//  Created by Enrique Miguel Bonilla Untiveros on 3/5/21.
//

class RealmDatabase {
    static let shared: RealmDatabase = RealmDatabase()
    private init() {}
}

extension RealmDatabase: CartDB {
    
    func updateCart() -> (Bool) {
        return true
    }
    
}
