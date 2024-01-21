//
//  SnackbarButton.swift
//  
//
//  Created by Nozhan Amiri on 1/21/24.
//

import SwiftUI

struct SnackbarButton: View, Identifiable, Equatable {
    let id = UUID()
    var title: LocalizedStringKey?
    var systemImage: String?
    var role: ButtonRole?
    let action: () -> Void
    
    var body: some View {
        if let title,
           let systemImage {
            Button(title, systemImage: systemImage, role: role, action: action)
                .buttonStyle(.snackbar)
        } else if let title {
            Button(title, role: role, action: action)
                .buttonStyle(.snackbar)
        } else if let systemImage {
            Button(role: role, action: action, label: {
                Image(systemName: systemImage)
                    .imageScale(.large)
            })
            .buttonStyle(.snackbar)
            .clipShape(.circle)
        }
    }
    
    static func == (lhs: SnackbarButton, rhs: SnackbarButton) -> Bool {
        lhs.id == rhs.id
    }
}

extension SnackbarButton {
    static func close(_ handler: Binding<Bool>) -> SnackbarButton {
        .init(systemImage: "xmark", role: .cancel) {
            withAnimation {
                handler.wrappedValue = false
            }
        }
    }
    
    static func close(_ action: @escaping () -> Void) -> SnackbarButton {
        .init(systemImage: "xmark", role: .cancel, action: action)
    }
    
    static func cancel(_ handler: Binding<Bool>) -> SnackbarButton {
        .init(title: "Cancel", role: .cancel) {
            withAnimation {
                handler.wrappedValue = false
            }
        }
    }
    
    static func cancel(_ action: @escaping () -> Void) -> SnackbarButton {
        .init(title: "Cancel", role: .cancel, action: action)
    }
}
