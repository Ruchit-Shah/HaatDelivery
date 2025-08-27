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
            Image(product.imageName)
                .resizable().scaledToFill()
                .frame(width: 130, height: 100)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(product.name).font(.subheadline).lineLimit(2)
            HStack {
                PriceView(now: product.priceNow, was: product.priceWas)
                Spacer()
            }
            if let unit = product.unit { Text(unit).font(.caption).foregroundStyle(.secondary) }
            QuantityStepper(qty: qty, onMinus: onMinus, onPlus: onPlus)
        }
        .frame(width: 150, alignment: .leading)
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
        }
    }
} 
