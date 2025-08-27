//
//  RoundIconButton.swift
//  HaatDelivery
//
//  Created by Ruchit on 27/08/25.
//

import SwiftUI


struct RoundIconButton: View {
    let systemName: String?    // for SF Symbol
    let imageName: String?     // for asset image
    let action: () -> Void
    
    init(systemName: String, action: @escaping () -> Void) {
        self.systemName = systemName
        self.imageName = nil
        self.action = action
    }
    
    init(imageName: String, action: @escaping () -> Void) {
        self.systemName = nil
        self.imageName = imageName
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Group {
                if let systemName = systemName {
                    Image(systemName: systemName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black) // always black icon
                } else if let imageName = imageName {
                    Image(imageName) // from Assets (e.g., "share")
                        .resizable()
                        .renderingMode(.template) // ensures tint works
                        .foregroundColor(.black)   // force black tint
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .frame(width: 44, height: 44)
            .background(
                Circle()
                    .fill(.ultraThinMaterial)
                    .overlay(Circle().stroke(Color.white.opacity(0.6), lineWidth: 1))
            )
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.18), radius: 8, y: 4)
        }
    }
}
