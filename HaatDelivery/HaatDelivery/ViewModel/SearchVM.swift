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
    
    let categories: [CategoryItem] = [
        .init(title: "Winter Deals", imageName: "winter_deals", fullWidth: false),
        .init(title: "Sales %", imageName: "winter_deals", fullWidth: false),
        .init(title: "Fruits & Vegetables", imageName: "winter_deals", fullWidth: false),
        .init(title: "Meat & Poultry", imageName: "winter_deals", fullWidth: false), // placeholder
        .init(title: "Cheese by weight", imageName: "winter_deals", fullWidth: false),
        .init(title: "Frozen products", imageName: "winter_deals", fullWidth: false),
        .init(title: "Biscuits & snacks", imageName: "winter_deals", fullWidth: false),
        .init(title: "Soft drinks", imageName: "winter_deals", fullWidth: false),
        .init(title: "Ice cream", imageName: "winter_deals", fullWidth: false),
        .init(title: "Dairy products & eggs", imageName: "winter_deals", fullWidth: false),
        .init(title: "Healthy products", imageName: "winter_deals", fullWidth: false),
        .init(title: "Sausages & pastrami", imageName: "winter_deals", fullWidth: false),
        .init(title: "Home supplies", imageName: "winter_deals", fullWidth: false),
        .init(title: "Coffee and tea", imageName: "winter_deals", fullWidth: false),
        .init(title: "Bread", imageName: "bread_mixed", fullWidth: true)
    ]
    
    lazy var recommendations: [Product] = [
        .init(name: "Kinder Bueno", brand: "Ferrero", priceNow: 8.49, unit: "2×43 g", imageName: "kinder_bueno", isDeal: true),
        .init(name: "Golden Apples", brand: nil, priceNow: 11.9, unit: "500 g", imageName: "apples_golden"),
        .init(name: "Fresh Milk 3%", brand: "Tnuva", priceNow: 10.0, unit: "1 L", imageName: "milk_carton"),
        .init(name: "Bread Mix", brand: "Bakery", priceNow: 6.9, unit: "1 pc", imageName: "bread_mixed")
    ]

    
    func qty(for product: Product) -> Int { quantities[product.id, default: 0] }
    func increment(_ product: Product) { quantities[product.id, default: 0] += 1 }
    func decrement(_ product: Product) { let q = quantities[product.id, default: 0]; if q > 0 { quantities[product.id] = q - 1 } }


}
