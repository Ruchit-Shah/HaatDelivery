//
//  ProductHeader.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct ProductHeader: View {
    @Binding var searchText: String

    var body: some View {
        ZStack {
            Image("hero_header")
                .resizable()
                .scaledToFill()
                .frame(height: 230)
                .ignoresSafeArea(edges: .top)
                .clipShape(RoundedRectangle(cornerRadius: 0))

            VStack {
                HStack {
                    RoundIconButton(systemName: "chevron.left") { }
                    Spacer()
                    HStack(spacing: 10) {
                        Image("search_icon")
                        TextField("Search products", text: $searchText)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)

                        if !searchText.isEmpty {
                            Button { searchText = "" } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.20), radius: 14, y: 6)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 12)
                    Spacer()
                    RoundIconButton(imageName: "share_icon") { }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)

                Spacer()

                
            }
        }
        .frame(height: 230)
    }
}
