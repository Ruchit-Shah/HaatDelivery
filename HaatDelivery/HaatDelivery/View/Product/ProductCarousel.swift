//
//  ProductCarousel.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//


import SwiftUI

struct ProductCarousel<Card: View>: View {
    let products: [Product]
    let card: (Product) -> Card
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(products) { p in card(p) }
            }
            .padding(.horizontal, 2)
        }
    }
}
