//
//  SnackbarButtonStyle.swift
//  
//
//  Created by Nozhan Amiri on 1/21/24.
//

import SwiftUI

public protocol SnackbarButtonStyle: ButtonStyle {
    var font: Font { get }
    associatedtype Foreground: ShapeStyle
    associatedtype Background: ShapeStyle
    associatedtype ClipShape: Shape
    func foreground(forButtonRole role: ButtonRole?) -> Foreground
    func background(forButtonRole role: ButtonRole?) -> Background
    func clipShape(forButtonRole role: ButtonRole?) -> ClipShape
}

extension SnackbarButtonStyle {
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration.label
            .font(font)
            .fontWeight(configuration.role == .cancel ? .regular : .bold)
            .foregroundStyle(foreground(forButtonRole: configuration.role))
            .padding(8)
            .background(background(forButtonRole: configuration.role))
            .clipShape(clipShape(forButtonRole: configuration.role))
    }
}
