//
//  CategoriesGrid.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct CategoriesGrid: View {
    let categories: [CategoryItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            GeometryReader { proxy in
                // Layout constants
                let outerPad: CGFloat = 16
                let spacing:  CGFloat = 12
                let totalW    = proxy.size.width - (outerPad * 2)
                let colW      = (totalW - spacing) / 2

                // Aspect ratios (width : height)
                let normalAspect: CGFloat = 1.58
                let wideAspect:   CGFloat = 2.80

                // Heights for cards
                let normalH = colW   / normalAspect
                let wideH   = totalW / wideAspect

                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: spacing),
                    GridItem(.flexible(), spacing: spacing)
                ], spacing: spacing) {
                    ForEach(categories) { cat in
                        CategoryCard(item: cat,
                                     height: cat.fullWidth ? wideH : normalH)
                            .if(cat.fullWidth) { $0.gridCellColumns(2) } // Bread spans both cols
                    }
                }
                .padding(.horizontal, outerPad)
            }
            // Give GeometryReader a stable height
            .frame(height: gridHeight(for: categories))
        }
    }
}

// MARK: - Helper to compute total grid height
private func gridHeight(for items: [CategoryItem],
                        outerPad: CGFloat = 16,
                        spacing: CGFloat = 12,
                        normalAspect: CGFloat = 1.58,
                        wideAspect: CGFloat = 2.80) -> CGFloat {
    let screenW = UIScreen.main.bounds.width
    let totalW  = screenW - (outerPad * 2)
    let colW    = (totalW - spacing) / 2
    let normalH = colW / normalAspect
    let wideH   = totalW / wideAspect

    // Count rows and sum heights
    var height: CGFloat = 0
    var i = 0
    while i < items.count {
        if items[i].fullWidth {
            height += wideH
            i += 1
        } else {
            if i + 1 < items.count && !items[i + 1].fullWidth {
                height += normalH
                i += 2
            } else {
                height += normalH
                i += 1
            }
        }
    }

    // Number of row gaps
    var rows: CGFloat = 0
    i = 0
    while i < items.count {
        if items[i].fullWidth { rows += 1; i += 1 }
        else if i + 1 < items.count && !items[i + 1].fullWidth { rows += 1; i += 2 }
        else { rows += 1; i += 1 }
    }
    let gaps = max(0, rows - 1)
    return height + gaps * spacing
}
