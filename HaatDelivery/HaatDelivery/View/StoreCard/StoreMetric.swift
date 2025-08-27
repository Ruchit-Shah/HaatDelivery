//
//  StoreMetric.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct StoreMetric: View {
    let icon: String
    let titleTop: String
    let titleBottom: String

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color(.systemGray6))
                    .frame(width: 36, height: 36)
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.primary)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(titleTop)
                    .font(.subheadline.weight(.semibold))
                Text(titleBottom)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
