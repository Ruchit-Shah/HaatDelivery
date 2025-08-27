//
//  ProductCard.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    let qty: Int
    let onMinus: () -> Void
    let onPlus: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable().scaledToFit() 
                    .frame(width: 110, height: 92)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Text(product.name).font(.subheadline).lineLimit(1)
            PriceView(now: product.priceNow, was: product.priceWas)
            if let u = product.unit { Text(u).font(.caption).foregroundStyle(.secondary) }
            QuantityStepper(qty: qty, onMinus: onMinus, onPlus: onPlus)
        }
        .frame(width: UIScreen.main.bounds.width / 4, alignment: .leading)
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
        }
    }
}
