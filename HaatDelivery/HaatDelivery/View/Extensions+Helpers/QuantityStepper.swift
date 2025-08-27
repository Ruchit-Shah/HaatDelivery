//
//  QuantityStepper.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct QuantityStepper: View {
    let qty: Int
    let onMinus: () -> Void
    let onPlus: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            Button(action: onMinus) {
                Image(systemName: "minus").frame(width: 30, height: 28)
            }.disabled(qty == 0)

            Divider().frame(height: 28)
            Text("\(qty)").frame(width: 34)
            Divider().frame(height: 28)

            Button(action: onPlus) {
                Image(systemName: "plus").frame(width: 30, height: 28)
            }
        }
        .font(.subheadline.weight(.semibold))
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 8))
    }
}
 
