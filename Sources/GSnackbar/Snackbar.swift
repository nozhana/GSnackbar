//
//  Snackbar.swift
//  
//
//  Created by Nozhan Amiri on 1/19/24.
//

import SwiftUI

struct Snackbar: View {
    let data: SnackbarData
    
    init(data: SnackbarData) {
        self.data = data
    }
    
    var body: some View {
        HStack(spacing: 16.0) {
            Group {
                switch data.style {
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
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(data.title)
                    .font(.headline)
                Text(data.description)
                    .font(.subheadline)
            } // VStack
            
            Spacer()
            
            VStack(alignment: .trailing) {
                ForEach(data.buttons) { $0 }
            } // VStack
        } // HStack
        .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
        .background {
            FrostedGlassView()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8), style: .continuous))
            
            data.background
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8), style: .continuous))
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .continuous)
                        .strokeBorder(lineWidth: 4.0)
                        .foregroundStyle(data.stroke)
                }
                .shadow(color: data.shadow, radius: 4, y: 4)
        }
    } // body
}

