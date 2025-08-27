//
//  SearchVM.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import Foundation
import Combine

final class MarketVM: ObservableObject {
    @Published var search = ""
    @Published var quantities: [UUID: Int] = [:]

    // Store
    let store = StoreInfo(
        name: "Carrefour Market",
        address: "Umm Al Fasouh, Aljada 09",
        isOpen: true,
        openUntil: "Open until 22:00",
        rating: 4.2,
        ratingCount: 1209,
        saleNote: "20% Sale on part of the items",
        deliveryNote: "No Delivery Fee on orders above 8D"
    )
    
    lazy var recentlyOrdered: [Product] = [
        .init(name: "Fresh Milk 3%", brand: "Tnuva", priceNow: 10.0, unit: "1 L", imageName: "milk_carton"),
        .init(name: "Golden Apples", brand: nil, priceNow: 11.9, unit: "500 g", imageName: "apples_golden"),
        .init(name: "Kinder Bueno", brand: "Ferrero", priceNow: 8.49, unit: "2×43 g", imageName: "kinder_bueno", isDeal: true)
    ]
    
    lazy var deals: [Product] = [
        .init(name: "Kinder Bueno", brand: "Ferrero", priceNow: 8.49, priceWas: 9.49, unit: "2×43 g", imageName: "kinder_bueno", isDeal: true),
        .init(name: "Fresh Milk 3%", brand: "Tnuva", priceNow: 9.9, priceWas: 11.9, unit: "1 L", imageName: "milk_carton", isDeal: true),
        .init(name: "Golden Apples", brand: nil, priceNow: 9.5, priceWas: 11.9, unit: "500 g", imageName: "apples_golden", isDeal: true)
    ]
    
    func qty(for product: Product) -> Int { quantities[product.id, default: 0] }
    func increment(_ product: Product) { quantities[product.id, default: 0] += 1 }
    func decrement(_ product: Product) { let q = quantities[product.id, default: 0]; if q > 0 { quantities[product.id] = q - 1 } }


}
