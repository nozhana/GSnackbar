//
//  SnackbarButtonStyle.swift
//  
//
//  Created by Nozhan Amiri on 1/21/24.
//

import SwiftUI

struct SnackbarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: configuration.role == .cancel ? .regular : .bold))
            .foregroundStyle(configuration.role == .destructive ? .red : configuration.role == .cancel ? .secondary : .accentColor)
            .padding(8)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 4, height: 4)))
    }
}

extension ButtonStyle where Self == SnackbarButtonStyle {
    static var snackbar: SnackbarButtonStyle { SnackbarButtonStyle() }
}
