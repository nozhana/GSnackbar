//
//  File.swift
//  
//
//  Created by Nozhan Amiri on 1/29/24.
//

import SwiftUI

public struct DefaultSnackbarButtonStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .fontWeight(configuration.role == .cancel ? .regular : .bold)
            .foregroundStyle(configuration.role == .cancel ? .primary : Color.white)
            .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(configuration.role == .cancel ? Color(uiColor: .systemFill) : configuration.role == .destructive ? .red : .blue)
            .clipShape(.roundedRect(8))
    }
}

extension ButtonStyle where Self == DefaultSnackbarButtonStyle {
    public static var snackbarDefault: Self { .init() }
}
