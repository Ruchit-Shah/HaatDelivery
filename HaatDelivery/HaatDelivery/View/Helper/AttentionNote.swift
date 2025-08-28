//
//  AttentionNote.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//


import SwiftUI

struct AttentionNote: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("For your attention")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.primary)

            Text("All our products are manufactured on shared machines and in the same production environment, so there is a risk of cross-contamination with allergens.")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true) // allow multiline
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.white) // ✅ plain white background
    }
}
