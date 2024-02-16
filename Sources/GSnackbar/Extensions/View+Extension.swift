//
//  View+Extension.swift
//
//
//  Created by Nozhan Amiri on 1/29/24.
//

import SwiftUI

extension View {
    func strokeOverlay(_ lineWidth: CGFloat = 2.0, cornerRadius: Int = 8, foregroundColor: Color = .black.opacity(0.2)) -> some View {
        overlay {
            RoundedRectangle(cornerSize: CGSize(width: cornerRadius, height: cornerRadius), style: .continuous)
                .strokeBorder(lineWidth: lineWidth)
                .foregroundStyle(foregroundColor)
        }
    }
}
