//
//  Snackbar.swift
//  
//
//  Created by Nozhan Amiri on 1/19/24.
//

import SwiftUI

struct Snackbar<Style, Content>: View where Style: SnackbarStyle, Content: View {
    let data: SnackbarData
    let style: Style
    let buttons: Content
    
    init(data: SnackbarData, style: Style = .defaultStyle(), @ViewBuilder buttons: @escaping () -> Content) {
        self.data = data
        self.style = style
        self.buttons = buttons()
    }
    
    var body: some View {
        HStack(spacing: 16.0) {
            Group {
                switch style.decoration {
                case .plain, .translucent:
                    EmptyView()
                case .info:
                    Image(systemName: "info.circle")
                case .warning:
                    Image(systemName: "exclamationmark.triangle")
                case .error:
                    Image(systemName: "exclamationmark.circle")
                case .success:
                    Image(systemName: "fireworks")
                }
            } // Group
            .imageScale(.large)
            .foregroundStyle(style.foregroundColor)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(data.title)
                    .font(style.titleFont)
                Text(data.description)
                    .font(style.descriptionFont)
            } // VStack
            .foregroundStyle(style.foregroundColor)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                buttons
                    .buttonStyle(style.buttonStyle)
            } // VStack
        } // HStack
        .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
        .background {
            Group {
                FrostedGlassView()
                style.backgroundColor
            }
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: style.cornerRadius, height: style.cornerRadius), style: .continuous))
            .overlay {
                RoundedRectangle(cornerSize: CGSize(width: style.cornerRadius, height: style.cornerRadius), style: .continuous)
                    .strokeBorder(lineWidth: 4.0)
                    .foregroundStyle(style.strokeColor)
            }
            .shadow(color: style.shadowColor, radius: 4, y: 4)
        }
    } // body
}
