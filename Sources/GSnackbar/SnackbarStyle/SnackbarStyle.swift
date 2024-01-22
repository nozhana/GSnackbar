//
//  SnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/22/24.
//

import SwiftUI

public protocol SnackbarStyle {
    var position: SnackbarPosition { get set }
    var duration: SnackbarDuration { get set }
    var decoration: SnackbarDecoration { get set }
    var backgroundColor: Color { get }
    var foregroundColor: Color { get }
    var strokeColor: Color { get }
    var shadowColor: Color { get }
    var transition: AnyTransition { get }
    var cornerRadius: CGFloat { get }
    var titleFont: Font { get }
    var descriptionFont: Font { get }
}

public enum SnackbarDuration {
    case persistent, flash
}

public enum SnackbarDecoration: Equatable {
    case plain, translucent, info, warning, error, success
}

public enum SnackbarPosition: Equatable {
    case top, bottom, center
    
    public var alignment: Alignment {
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
