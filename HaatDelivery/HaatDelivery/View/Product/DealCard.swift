//
//  DealCard.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct DealCard: View {
    let product: Product
    let qty: Int
    let onMinus: () -> Void
    let onPlus: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable().scaledToFill()
                    .frame(width: 125, height: 110)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                if product.isDeal {
                    Text("Deal")
                        .font(.caption2.weight(.bold))
                        .padding(.horizontal, 8).padding(.vertical, 4)
                        .background(Color.red, in: Capsule())
                        .foregroundStyle(.white)
                        .padding(8)
                }
            }
            Text(product.name).font(.subheadline).lineLimit(1)
            PriceView(now: product.priceNow, was: product.priceWas)
            if let u = product.unit { Text(u).font(.caption).foregroundStyle(.secondary) }
            QuantityStepper(qty: qty, onMinus: onMinus, onPlus: onPlus)
        }
        .frame(width: UIScreen.main.bounds.width / 3 - 20, alignment: .leading)
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
        }
    }
}
