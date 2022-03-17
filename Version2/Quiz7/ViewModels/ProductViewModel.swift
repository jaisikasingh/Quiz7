//
//  ProductViewModel.swift
//  Quiz7
//
//  Created by Jaisika Singh on 2022-03-16.
//

import Foundation
import Combine
import RealmSwift

final class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    private var token: NotificationToken?
    
    init() {
        setupObserver()
    }
    
    deinit {
        token?.invalidate()
    }
    
    // setup an observer
    private func setupObserver() {
        do {
            let realm = try Realm()
            
            let results = realm.objects(ProductObject.self)
            
            token = results.observe({ [weak self] changes in
                self?.products = results.map(Product.init)
                    .sorted(by: { $0.completedAt > $1.completedAt})
            })
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // add
    func addProduct(title: String, price: Float) async {
        let productObject = ProductObject(value: [
            "title": title,
            "price": price
        ])
        do {
            let realm = try await Realm()
        
            try realm.write{
                realm.add(productObject)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

