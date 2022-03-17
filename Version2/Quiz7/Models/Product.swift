//
//  Product.swift
//  Quiz7
//
//  Created by Jaisika Singh on 2022-03-16.
//

import Foundation

struct Product: Identifiable {
    var id: String
    var title: String
    var price: Float = 0
    var completedAt: Date = Date()

    init(productObject: ProductObject) {
        self.id = productObject.id.stringValue
        self.title = productObject.title
        self.price = productObject.price
        self.completedAt = productObject.completedAt
    }
    
var completeDate: String {
        let format = "MMM d, y"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return "Due at " + dateFormatter.string(from: completedAt)
    }
}
