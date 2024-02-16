//
//  FullscreenSnackbarButtonStyle.swift
//
//
//  Created by Nozhan Amiri on 2/16/24.
//

import SwiftUI

public struct FullscreenSnackbarButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(configuration.role == .destructive ? Color.red : .primary)
            .font(.system(size: 21, weight: .bold))
            .padding(.init(top: 12, leading: 18, bottom: 12, trailing: 18))
            .background(
                Capsule(style: .continuous)
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundStyle(configuration.role == .cancel ? .secondary : configuration.role == .destructive ? Color.red : .primary)
            )
    }
}

extension ButtonStyle where Self == FullscreenSnackbarButtonStyle {
    public static var fullscreenSnackbar: Self { .init() }
}
