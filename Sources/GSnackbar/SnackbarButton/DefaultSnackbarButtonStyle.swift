//
//  DefaultSnackbarButtonStyle.swift
//
//
//  Created by Nozhan Amiri on 1/22/24.
//

import SwiftUI

public struct DefaultSnackbarButtonStyle: SnackbarButtonStyle {
    public var font: Font { .system(size: 14) }
    
    public func foreground(forButtonRole role: ButtonRole?) -> some ShapeStyle {
        guard let role else { return Color.accentColor }
        
        switch role {
        case .destructive:
            return Color.red
        case .cancel:
            return Color.secondary
        default:
            return Color.accentColor
        }
    }
    
    public func background(forButtonRole role: ButtonRole?) -> some ShapeStyle {
        Material.thinMaterial
    }
    
    public func clipShape(forButtonRole role: ButtonRole?) -> some Shape {
        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4), style: .continuous)
    }
}

extension ButtonStyle where Self == DefaultSnackbarButtonStyle {
    public static var defaultStyle: some SnackbarButtonStyle { DefaultSnackbarButtonStyle() }
}
