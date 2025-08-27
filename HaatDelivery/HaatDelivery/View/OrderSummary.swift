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
                        
                        
                        StoreCard(store: vm.store)
                            .padding(.horizontal, 16)
                            .offset(y: -40)              // pull upwards
                            .zIndex(1)
                            .padding(.bottom, -40)
                        
                        
                        AttentionNote()
                            .padding(.horizontal, 0)
                        
                        SectionHeader(title: "Recently ordered") {
                            Text("View all").font(.callout).foregroundColor(.blue)
                        }.padding(.horizontal, 16)
                        
                        ProductCarousel(products: vm.recentlyOrdered) { p in
                            ProductCard(product: p,
                                        qty: vm.qty(for: p),
                                        onMinus: { vm.decrement(p) },
                                        onPlus:  { vm.increment(p) })
                        }.padding(.leading, 16)
                        
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)      // hide default bar to match design
            .background(Color(.systemGroupedBackground))
        }
    }
}
