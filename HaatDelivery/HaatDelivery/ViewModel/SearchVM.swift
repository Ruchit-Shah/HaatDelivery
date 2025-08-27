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
    

}
