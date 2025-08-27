//
//  OrderSummary.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct OrderSummary: View {
    @StateObject private var vm = MarketVM()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 16) {

                        // HERO with buttons + centered search
                        ProductTopHeader(searchText: $vm.search)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)      // hide default bar to match design
            .background(Color(.systemGroupedBackground))
        }
    }
}
