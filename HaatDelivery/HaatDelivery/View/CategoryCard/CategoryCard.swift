//
//  CategoryCard.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//


import SwiftUI

struct CategoryCard: View {
    let item: CategoryItem
    let height: CGFloat

    private let radius: CGFloat = 14

    var body: some View {
        CardContainer(radius: radius) {
            if item.fullWidth {
                BreadContent(imageName: item.imageName, title: item.title, height: height)
            } else {
                RegularContent(imageName: item.imageName, title: item.title, height: height)
            }
        }
    }
}

// MARK: Outer card
private struct CardContainer<Content: View>: View {
    let radius: CGFloat
    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                        .stroke(Color.black.opacity(0.06), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.08), radius: 10, y: 6)

            content()
                .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
        }
        .contentShape(RoundedRectangle(cornerRadius: radius))
    }
}

// MARK: Bread (full width)
private struct BreadContent: View {
    let imageName: String
    let title: String
    let height: CGFloat

    private let captionH: CGFloat = 48
    private var imageHeight: CGFloat { max(0, height - captionH) }

    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: imageHeight)
                .frame(maxWidth: .infinity)
                .clipped()

            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)   // split to avoid “extra argument” error
                .frame(height: captionH)
                .multilineTextAlignment(.center)
                .background(Color.white)
        }
    }
}

// MARK: Regular tile
private struct RegularContent: View {
    let imageName: String
    let title: String
    let height: CGFloat

    private var bandHeight: CGFloat {
        let h = height * 0.33
        return min(56, max(44, h))
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .clipped()

            Rectangle()
                .fill(.ultraThinMaterial)
                .overlay(
                    LinearGradient(colors: [.clear, .black.opacity(0.15)],
                                   startPoint: .top, endPoint: .bottom)
                )
                .frame(height: bandHeight)
                .overlay(
                    Text(title)
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .padding(.horizontal, 12)
                        .padding(.bottom, 8),
                    alignment: .bottomLeading
                )
                .frame(maxWidth: .infinity, alignment: .bottom)
                .allowsHitTesting(false)
        }
    }
}

// MARK: Conditional helper
extension View {
    @ViewBuilder func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition { transform(self) } else { self }
    }
}
