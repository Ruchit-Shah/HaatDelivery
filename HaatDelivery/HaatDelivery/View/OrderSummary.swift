//
//  OrderSummary.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct OrderSummary: View {
    @StateObject private var vm = MarketVM()

    
    private let cols = [
            GridItem(.flexible(), spacing: 12),
            GridItem(.flexible(), spacing: 12)
        ]

    
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
                        
                        
                        SectionHeader(title: "Deals") { EmptyView() }
                            .padding(.horizontal, 16)
                        ProductCarousel(products: vm.deals) { p in
                            DealCard(product: p,
                                     qty: vm.qty(for: p),
                                     onMinus: { vm.decrement(p) },
                                     onPlus:  { vm.increment(p) })
                        }.padding(.leading, 16)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Available Categories")
                                .font(.headline)
                                .padding(.horizontal, 16)

                            let outerPad: CGFloat = 16
                            let spacing: CGFloat   = 12
                            let screenW            = UIScreen.main.bounds.width
                            let totalW             = screenW - (outerPad * 2)
                            let colW               = (totalW - spacing) / 2

                            // Aspect ratios (width : height)
                            let normalAspect: CGFloat = 1.58
                            let wideAspect:   CGFloat = 2.80

                            let normalH = colW   / normalAspect
                            let wideH   = totalW / wideAspect

                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: spacing),
                                GridItem(.flexible(), spacing: spacing)
                            ], spacing: spacing) {
                                ForEach(vm.categories) { item in
                                    CategoryCard(item: item,
                                                 height: item.fullWidth ? wideH : normalH)
                                        .gridCellColumns(item.fullWidth ? 2 : 1)   // ✅ span two columns when needed
                                }
                            }
                            .padding(.horizontal, outerPad)
                        }
                        
                        SectionHeader(title: "You might also want") { EmptyView() }
                            .padding(.horizontal, 16)
//                        RecommendationGrid(products: vm.recommendations,
//                                           qty: { vm.qty(for: $0) },
//                                           onMinus: { vm.decrement($0) },
//                                           onPlus: { vm.increment($0) })
//                            .padding(.horizontal, 16)
//                            .padding(.bottom, 96) // room for sticky bar
                        
                        RecommendationGrid(products: vm.deals) { p in
                            ProductCard(product: p,
                                     qty: vm.qty(for: p),
                                     onMinus: { vm.decrement(p) },
                                     onPlus:  { vm.increment(p) })
                        }.padding(.leading, 16)
                        
                        Spacer(minLength: 12)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)      // hide default bar to match design
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private func gridHeight(for items: [CategoryItem],
                            outerPad: CGFloat = 16,
                            spacing: CGFloat = 12,
                            normalAspect: CGFloat = 1.55,
                            wideAspect: CGFloat = 2.60) -> CGFloat {
        // Estimate using screen width (safe enough for scroll content)
        let screenW = UIScreen.main.bounds.width
        let totalW  = screenW - (outerPad * 2)
        let colW    = (totalW - spacing) / 2
        let normalH = colW / normalAspect
        let wideH   = totalW / wideAspect

        // Count rows (2 per row, except a fullWidth item takes its own row)
        var rows: CGFloat = 0
        var i = 0
        while i < items.count {
            if items[i].fullWidth {
                rows += 1
                i += 1
            } else {
                // try to pair two normal items
                if i + 1 < items.count && !items[i+1].fullWidth {
                    rows += 1
                    i += 2
                } else {
                    rows += 1
                    i += 1
                }
            }
        }

        // Sum heights: each normal row = normalH, fullWidth rows = wideH
        var height: CGFloat = 0
        i = 0
        while i < items.count {
            if items[i].fullWidth {
                height += wideH
                i += 1
            } else {
                if i + 1 < items.count && !items[i+1].fullWidth {
                    height += normalH
                    i += 2
                } else {
                    height += normalH
                    i += 1
                }
            }
        }

        // Add vertical spacings between rows
        let gaps = max(0, rows - 1)
        return height + gaps * spacing
    }
}
