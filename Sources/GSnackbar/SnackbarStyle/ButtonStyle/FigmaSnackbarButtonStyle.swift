//
//  FigmaSnackbarButtonStyle.swift
//
//
//  Created by Nozhan Amiri on 1/29/24.
//

import SwiftUI

public struct FigmaSnackbarButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .fontWeight(.medium)
            .foregroundStyle(configuration.role == .cancel ? .primary : Color.white)
            .padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            .background(configuration.role == .cancel ? .clear : configuration.role == .destructive ? Color(red: 0.95, green: 0.28, blue: 0.13) : Color(red: 0.09, green: 0.63, blue: 0.98))
            .clipShape(.roundedRect(6))
            .strokeOverlay(1, cornerRadius: 6, foregroundColor: configuration.role == .cancel ? .primary : .clear)
    }
}

extension ButtonStyle where Self == FigmaSnackbarButtonStyle {
    public static var snackbarFigma: Self { .init() }
}
