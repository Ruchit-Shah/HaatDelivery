//
//  NoticeStrip.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct NoticeStrip: View {
    let leadingSF: String
    let accent: Color
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(accent.opacity(0.12))
                    .frame(width: 32, height: 32)
                Image(systemName: leadingSF)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(accent)
            }

            // title + subtitle inline, first part colored/bold
            if #available(iOS 17.0, *) {
                (
                    Text(title).font(.subheadline.weight(.semibold)).foregroundStyle(accent)
                    + Text(" \(subtitle)").font(.subheadline)
                )
            } else {
                // Fallback on earlier versions
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.systemGray6))
        )
    }
}
