//
//  StoreCard.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct StoreCard: View {
    let store: StoreInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            // Header
            HStack(alignment: .top, spacing: 12) {
                Image("logo_carrefour")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.top, 2)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Carrefour Market")
                        .font(.system(size: 22, weight: .heavy)) // bold like screenshot
                    
                    Text("Umm Al Fahem, Alquds 09")
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray.opacity(0.7))
                    
                    (
                        Text("Open").foregroundColor(.green).fontWeight(.semibold)
                        + Text(" until 23:00").foregroundColor(Color.gray.opacity(0.7))
                    )
                    .font(.system(size: 15))
                }
                
                Spacer()
                
                VStack(spacing: 16) {
                    Image(systemName: "heart")
                        .font(.system(size: 22, weight: .regular))
                        .foregroundColor(.black)
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black.opacity(0.7))
                }
            }
            
            Divider().padding(.top, 2)
            
            // Metrics row
            HStack(alignment: .center) {
                StoreMetric(icon: "shippingbox", titleTop: "Loading", titleBottom: "…")
                Spacer(minLength: 8)
                StoreMetric(icon: "clock", titleTop: "Sun", titleBottom: "8:00 - 23:00")
                Spacer(minLength: 8)
                RatingPill(rating: store.rating, count: store.ratingCount)
            }
            
            // Notices
            NoticeStrip(
                leadingSF: "tag.fill",
                accent: .pink,
                title: "-20% Sale",
                subtitle: "on part of the items"
            )
            
            NoticeStrip(
                leadingSF: "bicycle",
                accent: .green,
                title: "₪0 Delivery Fee",
                subtitle: "on orders above ₪80"
            )
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .background {
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(Color(.systemBackground))
                .overlay( // subtle inner white stroke like your mock
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .stroke(Color.white.opacity(0.75), lineWidth: 1)
                )
            // soft blue “glow” + gentle drop shadow
                .shadow(color: Color.blue.opacity(0.18), radius: 26, x: 0, y: 10)
                .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
        }
    }
}
