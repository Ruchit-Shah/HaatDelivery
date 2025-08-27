//
//  RecommendationGrid.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct RecommendationGrid<Card: View>: View {
    let products: [Product]
    let card: (Product) -> Card

    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(products) { p in
                        card(p)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
            }
            .scrollClipDisabled()
        } else {
            // Fallback on earlier versions
        } // keeps the glow visible at edges
    }
}
