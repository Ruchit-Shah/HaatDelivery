//
//  SectionHeader.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI

struct SectionHeader<Accessory: View>: View {
    let title: String
    @ViewBuilder var accessory: () -> Accessory
    var body: some View {
        HStack {
            Text(title).font(.headline)
            Spacer()
            accessory()
        }
        .padding(.horizontal, 4)
    }
}
