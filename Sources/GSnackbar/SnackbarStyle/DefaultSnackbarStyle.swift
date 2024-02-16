//
//  DefaultSnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

public struct DefaultSnackbarStyle: SnackbarStyle {
    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        makeLabel(configuration: configuration)
            .foregroundStyle(.primary)
            .padding()
            .background {
                ZStack {
                    Color(uiColor: .systemBackground)
                    configuration.role?.color.opacity(0.33)
                }
            }
            .clipShape(.roundedRect())
            .overlay {
                RoundedRectangle.roundedRect()
                    .strokeBorder(lineWidth: 4)
                    .foregroundStyle(Color.accentColor.opacity(0.2).blendMode(.multiply))
            }
            .shadow(color: .cyan.opacity(0.1), radius: 8, y: 4)
            .padding()
    }
}

extension SnackbarStyle where Self == DefaultSnackbarStyle {
    public static var `default`: Self { .init() }
}
