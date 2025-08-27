//
//  Product.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var brand: String?
    var priceNow: Double
    var priceWas: Double? = nil
    var unit: String? = nil
    var imageName: String
    var isDeal: Bool = false
}
