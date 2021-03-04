//
//  GroceryResult.swift
//  Sample 2
//
//  Created by Enrique Miguel Bonilla Untiveros on 3/4/21.
//

import Foundation

struct GroceryResult: Codable {
    let groceries: [Grocery]

}

struct Grocery: Codable {
    let skyId: String
    let title: String
    let image: String
    let details: String
    let price: Double
    
    private enum CodingKeys: String, CodingKey {
        case skyId = "sku-id"
        case title
        case image = "product_image"
        case details 
        case price
    }
}


