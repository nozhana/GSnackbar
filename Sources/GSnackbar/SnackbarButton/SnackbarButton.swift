//
//  SnackbarButton.swift
//  
//
//  Created by Nozhan Amiri on 1/21/24.
//

import SwiftUI

public struct SnackbarButton: View, Identifiable, Equatable {
    public let id = UUID()
    public var title: LocalizedStringKey?
    public var systemImage: String?
    public var role: ButtonRole?
    public let action: () -> Void
    public var style: some SnackbarButtonStyle = .defaultStyle
    
    public var body: some View {
        if let title,
           let systemImage {
            Button(title, systemImage: systemImage, role: role, action: action)
                .buttonStyle(style)
        } else if let title {
            Button(title, role: role, action: action)
                .buttonStyle(style)
        } else if let systemImage {
            Button(role: role, action: action, label: {
                Image(systemName: systemImage)
                    .imageScale(.large)
            })
            .buttonStyle(style)
            .clipShape(.circle)
        }
    }
    
    public static func == (lhs: SnackbarButton, rhs: SnackbarButton) -> Bool {
        lhs.id == rhs.id
    }
}

extension SnackbarButton {
    public static func close(_ handler: Binding<Bool>) -> SnackbarButton {
        .init(systemImage: "xmark", role: .cancel) {
            withAnimation {
                handler.wrappedValue = false
            }
        }
    }
    
    public static func close(_ action: @escaping () -> Void) -> SnackbarButton {
        .init(systemImage: "xmark", role: .cancel, action: action)
    }
    
    public static func cancel(_ handler: Binding<Bool>) -> SnackbarButton {
        .init(title: "Cancel", role: .cancel) {
            withAnimation {
                handler.wrappedValue = false
            }
        }
    }
    
    public static func cancel(_ action: @escaping () -> Void) -> SnackbarButton {
        .init(title: "Cancel", role: .cancel, action: action)
    }
}
