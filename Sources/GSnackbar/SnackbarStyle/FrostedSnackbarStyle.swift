//
//  FrostedSnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

public struct FrostedSnackbarStyle: SnackbarStyle {
    public init() {}
    
    public var buttonStyle: some ButtonStyle {
        .snackbarFrosted
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        makeLabel(configuration: configuration)
            .foregroundStyle(.primary)
            .padding()
            .background {
                ZStack {
                    FrostedGlassView()
                    configuration.role?.color.opacity(0.24)
                }
            }
            .clipShape(.roundedRect())
            .overlay {
                RoundedRectangle.roundedRect()
                    .strokeBorder(lineWidth: 2)
                    .foregroundStyle(Color(uiColor: .systemCyan.withAlphaComponent(0.2)).blendMode(.multiply))
            }
            .shadow(color: .cyan.opacity(0.1), radius: 8, y: 4)
            .padding()
    }
}

extension SnackbarStyle where Self == FrostedSnackbarStyle {
    public static var frosted: Self { .init() }
}

