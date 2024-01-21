//
//  SnackbarData.swift
//  
//
//  Created by Nozhan Amiri on 1/20/24.
//

import SwiftUI

public struct SnackbarData: Equatable {
    public enum SnackbarDuration {
        case persistent, flash
    }
    
    public enum SnackbarStyle: Equatable {
        case plain, translucent, info, warning, error, success
    }
    
    public enum SnackbarPosition {
        case top, bottom, center
        
        var alignment: Alignment {
            switch self {
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .center:
                return .center
            }
        }
    }
    
    var title: String
    var description: String
    var duration: SnackbarDuration = .flash
    var position: SnackbarPosition = .top
    var style: SnackbarStyle = .plain
    var buttons: [SnackbarButton] = []
    
    var background: Color {
        switch style {
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
    
    var stroke: Color {
        switch style {
        case .plain:
            return .accentColor.opacity(0.1)
        default:
            return .blend(background, .primary.opacity(0.2))
        }
    }
    
    var shadow: Color {
        switch style {
        case .plain:
            return .init(white: 0.0, opacity: 0.1)
        case .translucent:
            return .init(white: 0.2, opacity: 0.1)
        default:
            return .blend(background, .black.opacity(0.2))
        }
    }
    
    var transition: AnyTransition {
        switch position {
        case .top:
            return .move(edge: .top).combined(with: .opacity)
        case .bottom:
            return .move(edge: .bottom).combined(with: .opacity)
        case .center:
            return .push(from: .bottom).combined(with: .opacity)
        }
    }
}

