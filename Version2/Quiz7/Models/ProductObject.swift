//
//  ProductObject.swift
//  Quiz7
//
//  Created by Jaisika Singh on 2022-03-16.
//

import Foundation
import RealmSwift

class ProductObject: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var price: Float = 0
    @Persisted var completedAt : Date = Date()
}
