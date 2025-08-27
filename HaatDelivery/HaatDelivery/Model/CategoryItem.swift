//
//  CategoryItem.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import Foundation

struct CategoryItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var fullWidth: Bool = false
}
