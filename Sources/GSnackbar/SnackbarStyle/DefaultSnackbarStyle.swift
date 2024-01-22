//
//  DefaultSnackbarStyle.swift
//  
//
//  Created by Nozhan Amiri on 1/22/24.
//

import SwiftUI

public struct DefaultSnackbarStyle: SnackbarStyle {
    public init(duration: SnackbarDuration = .flash, decoration: SnackbarDecoration = .plain, position: SnackbarPosition = .top) {
        self.duration = duration
        self.decoration = decoration
        self.position = position
    }
    
    public var duration: SnackbarDuration
    public var decoration: SnackbarDecoration
    public var position: SnackbarPosition
    
    public var backgroundColor: Color {
        switch decoration {
        case .plain:
            return .init(uiColor: .systemBackground)
        case .translucent:
            return .white.opacity(0.1)
        case .info:
            return .snackbarInfo
        case .warning:
            return .snackbarWarning
        case .error:
            return .snackbarError
        case .success:
            return .snackbarSuccess
        }
    }
    
    public let foregroundColor: Color = .primary
    
    public var strokeColor: Color {
        switch decoration {
        case .plain:
            return .blend(.accentColor.opacity(0.2), backgroundColor)
        default:
            return .blend(.primary.opacity(0.2), backgroundColor)
        }
    }
    
    public var shadowColor: Color {
        switch decoration {
        case .plain:
            return .black.opacity(0.1)
        case .translucent:
            return .init(white: 0.2, opacity: 0.1)
        default:
            return .blend(backgroundColor, .black.opacity(0.2))
        }
    }
    
    public var transition: AnyTransition {
        switch position {
        case .top:
            return .move(edge: .top).combined(with: .opacity)
        case .bottom:
            return .move(edge: .bottom).combined(with: .opacity)
        case .center:
            return .push(from: .bottom).combined(with: .opacity)
        }
    }
    
    public let cornerRadius: CGFloat = 8.0
    
    public let titleFont: Font = .headline
    public let descriptionFont: Font = .subheadline
    public let buttonStyle: some SnackbarButtonStyle = DefaultSnackbarButtonStyle()
}


extension SnackbarStyle where Self == DefaultSnackbarStyle {
    public static func defaultStyle(duration: SnackbarDuration = .flash,
                                    decoration: SnackbarDecoration = .plain,
                                    position: SnackbarPosition = .top) -> some SnackbarStyle {
        DefaultSnackbarStyle(duration: duration, decoration: decoration, position: position)
    }
}
