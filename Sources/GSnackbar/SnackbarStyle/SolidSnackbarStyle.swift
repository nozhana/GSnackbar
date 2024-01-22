//
//  SolidSnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/22/24.
//

import SwiftUI

public struct SolidSnackbarStyle: SnackbarStyle {
    public var duration: SnackbarDuration = .flash
    public var decoration: SnackbarDecoration = .plain
    public var position: SnackbarPosition = .top
    
    public var backgroundColor: Color {
        switch decoration {
        case .plain:
            return .init(uiColor: .systemBackground)
        case .translucent:
            return .white.opacity(0.1)
        case .info:
            return .snackbarInfoSolid
        case .warning:
            return .snackbarWarningSolid
        case .error:
            return .snackbarErrorSolid
        case .success:
            return .snackbarSuccessSolid
        }
    }
    
    public var foregroundColor: Color {
        switch decoration {
        case .plain, .translucent:
            return .primary
        default:
            return .white
        }
    }
    
    public var strokeColor: Color {
        switch decoration {
        case .plain:
            return .blend(.accentColor.opacity(0.2), backgroundColor.opacity(0.2))
        default:
            return .blend(.primary.opacity(0.5), backgroundColor.opacity(0.5))
        }
    }
    
    public var shadowColor: Color {
        switch decoration {
        case .plain:
            return .black.opacity(0.1)
        case .translucent:
            return .init(white: 0.2, opacity: 0.1)
        default:
            return .blend(backgroundColor.opacity(0.2), .black.opacity(0.2))
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
}


extension SnackbarStyle where Self == SolidSnackbarStyle {
    public static func solidStyle(duration: SnackbarDuration = .flash,
                                    decoration: SnackbarDecoration = .plain,
                                    position: SnackbarPosition = .top) -> some SnackbarStyle {
        SolidSnackbarStyle(duration: duration, decoration: decoration, position: position)
    }
}
