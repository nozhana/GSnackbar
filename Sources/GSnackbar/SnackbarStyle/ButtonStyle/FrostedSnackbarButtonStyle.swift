//
//  FrostedSnackbarButtonStyle.swift
//
//
//  Created by Nozhan Amiri on 1/29/24.
//

import SwiftUI

public struct FrostedSnackbarButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .fontWeight(configuration.role == .cancel ? .regular : .bold)
            .foregroundStyle(configuration.role == .cancel ? .primary : configuration.role == .destructive ? Color.red : Color.blue)
            .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(.thinMaterial)
            .clipShape(.roundedRect(4))
            .strokeOverlay(1, cornerRadius: 4, foregroundColor: configuration.role == .cancel ? Color(uiColor: .separator.withAlphaComponent(0.2)) : configuration.role == .destructive ? .red.opacity(0.2) : .blue.opacity(0.2))
    }
}

extension ButtonStyle where Self == FrostedSnackbarButtonStyle {
    public static var snackbarFrosted: Self { .init() }
}
