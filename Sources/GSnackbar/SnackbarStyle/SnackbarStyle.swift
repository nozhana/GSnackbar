//
//  SnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

public protocol SnackbarStyle {
    associatedtype Body: View
    typealias Configuration = SnackbarConfiguration
    
    associatedtype SnackbarButtonStyle: ButtonStyle
    var buttonStyle: SnackbarButtonStyle { get }
    
    func transition(forPosition position: SnackbarPosition) -> AnyTransition
    
    @ViewBuilder
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

extension SnackbarStyle {
    public var buttonStyle: some ButtonStyle {
        .snackbarDefault
    }
    
    public func transition(forPosition position: SnackbarPosition = .top) -> AnyTransition {
        switch position {
        case .top:
            return .move(edge: .top).combined(with: .opacity)
        case .center:
            return .push(from: .bottom).combined(with: .opacity)
        case .bottom:
            return .move(edge: .bottom).combined(with: .opacity)
        }
    }
    
    @ViewBuilder
    public func makeLabel(configuration: Self.Configuration) -> some View {
        HStack(spacing: 16) {
            if let icon = configuration.icon {
                Image(systemName: icon)
                    .imageScale(.large)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                if let title = configuration.title {
                    Text(title)
                        .font(.headline)
                        .bold()
                }
                Text(configuration.content)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if !configuration.buttonConfigurations.isEmpty {
                VStack(alignment: .trailing, spacing: 8) {
                    configuration.buttonConfigurations.buttons
                        .buttonStyle(buttonStyle)
                }
            }
        }
    }
}

extension SnackbarView {
    @ViewBuilder
    public func snackbarStyle<S>(_ style: S) -> some View where S: SnackbarStyle {
        SnackbarView<S>(self.configuration, style: style)
    }
}
