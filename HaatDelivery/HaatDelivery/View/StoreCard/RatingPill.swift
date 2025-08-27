//
//  RatingPill.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct RatingPill: View {
    let rating: Double
    let count: Int

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color(.systemGray6))
                    .frame(width: 36, height: 36)
                Image(systemName: "star.fill")
                    .font(.system(size: 15))
                    .foregroundStyle(.yellow)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(String(format: "%.1f", rating))
                        .font(.subheadline.weight(.semibold))
                    Text("(\(count)+)")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Text("Top rated")
                    .font(.caption2.weight(.bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.red, in: Capsule())
                    .foregroundStyle(.white)
            }
        }
    }
}
