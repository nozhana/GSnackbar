//
//  FigmaSnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/29/24.
//

import SwiftUI

public struct FigmaSnackbarStyle: SnackbarStyle {
    public init() {}
    
    public var buttonStyle: some ButtonStyle {
        .snackbarFigma
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                if let icon = configuration.icon {
                    Image(systemName: icon)
                        .imageScale(.large)
                }
                
                if let title = configuration.title {
                    Text(title)
                        .font(.headline)
                        .bold()
                }
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                })
                .foregroundStyle(.primary)
            } // HStack
            
            Text(configuration.content)
                .font(.subheadline)
            
            if !configuration.buttonConfigurations.isEmpty {
                HStack {
                    Spacer()
                    configuration.buttonConfigurations.buttons
                        .buttonStyle(buttonStyle)
                }
            }
        } // VStack
        .padding(16)
        .background {
            ZStack {
                Rectangle()
                    .fill(.background)
                
                if let role = configuration.role {
                    switch role {
                    case .informative:
                        Rectangle()
                            .fill(.cyan.opacity(0.2))
                    case .failure:
                        Rectangle()
                            .fill(.red.opacity(0.2))
                    case .warning:
                        Rectangle()
                            .fill(.orange.opacity(0.2))
                    case .success:
                        Rectangle()
                            .fill(.green.opacity(0.2))
                    }
                } // if
            } // ZStack
        } // .background
        .clipShape(.roundedRect(4))
        .strokeOverlay(1.0, cornerRadius: 4, foregroundColor: .primary.opacity(0.2))
        .shadow(color: .black.opacity(0.15), radius: 14, y: 2)
        .padding()
    }
}

extension SnackbarStyle where Self == FigmaSnackbarStyle {
    public static var figma: Self { .init() }
}
