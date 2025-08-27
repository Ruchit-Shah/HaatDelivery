//
//  PriceView.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct PriceView: View {
    let now: Double
    let was: Double?
    private let currency = "₪" // match screenshot style

    var body: some View {
        HStack(spacing: 6) {
            Text("\(currency)\(String(format: "%.2f", now))").font(.headline)
            if let was {
                Text("\(currency)\(String(format: "%.2f", was))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .strikethrough()
            }
        }
    }
}
