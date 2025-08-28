//
//  HomeView.swift
//  HaatDelivery
//
//  Created by Ruchit on 28/08/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    bannerSection
                    moodSection(viewModel: viewModel)
                    exploreMarketSection
                    marketCardList(viewModel: viewModel)
                    Spacer()
                }
                .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 12) {
                        // 🍔 Menu icon
                        Image(systemName: "line.horizontal.3")
                            .font(.title3)
                            .foregroundColor(.black)

                        // 📍 Location capsule
                        HStack(spacing: 6) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.red)

                            Text("Umm al-fahem...")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .truncationMode(.tail)

                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .frame(width: 190)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
        }
    }

    // MARK: - Sections

    private var bannerSection: some View {
        Image("banner")
            .resizable()
            .frame(width: 375, height: 328)
            .cornerRadius(12)
            .padding(.horizontal)
    }

    private func moodSection(viewModel: HomeViewModel) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("What are you in the mood for? 🤔")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.moodOptions) { item in
                        VStack {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 88, height: 88)
                                .cornerRadius(10)
                            Text(item.title)
                                .font(.caption)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private var exploreMarketSection: some View {
        HStack(alignment: .center) {
            // LEFT SIDE: Text Block
            VStack(alignment: .leading, spacing: 6) {
                // This HStack prevents breaking into new line
                HStack(spacing: 6) {
                    Text("Explore")
                        .font(.title2.bold())
                        .foregroundColor(Color(red: 59/255, green: 29/255, blue: 0))
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)

                    Image("haatlogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)

                    Text("Market")
                        .font(.title2.bold())
                        .foregroundColor(Color(red: 59/255, green: 29/255, blue: 0))
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                }

                Text("Everything you need")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("Go to market >")
                    .font(.subheadline.bold())
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }

            Spacer()

            // RIGHT SIDE: Basket image
            Image("112x85px") // your 112x85 image
                .resizable()
                .frame(width: 112, height: 85)
        }
        .padding()
        .background(Color(red: 1.0, green: 0.94, blue: 0.92)) // light peach
        .cornerRadius(12)
        .padding(.horizontal)
    }
    

    private func marketCardList(viewModel: HomeViewModel) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(viewModel.marketCards) { card in
                    VStack(alignment: .leading, spacing: 8) {
                        // 🔴 Discount badges
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 4) {
                                if card.isFree {
                                    Text("FREE")
                                        .font(.caption2.bold())
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 4)
                                        .background(Color.red)
                                        .cornerRadius(3)
                                }

                                Text(card.badge)
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 6)
                                    .background(Color.red)
                                    .cornerRadius(3)
                            }

                            if let sub = card.subBadge {
                                Text(sub)
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 6)
                                    .background(Color.red)
                                    .cornerRadius(3)
                            }
                        }

                        // 🖼️ Centered circular image
                        HStack {
                            Spacer()
                            Image(card.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(85/2)
                            Spacer()
                        }

                        // 📝 Title + open time
                        VStack(alignment: .leading, spacing: 4) {
                            Text(card.title)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fixedSize(horizontal: false, vertical: true)

                            Text("Open until \(card.openUntil)")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    .frame(width: 160, height: 220)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal)
        }
    }
}
