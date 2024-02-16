//
//  FullscreenSnackbarStyle.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

public struct FullscreenSnackbarStyle: SnackbarStyle {
    public init() {}
    
    public func transition(forPosition position: SnackbarPosition) -> AnyTransition {
        .opacity
    }
    
    public var buttonStyle: some ButtonStyle {
        .fullscreenSnackbar
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            FrostedGlassView(blurStyle: .systemMaterial)
            
            VStack(alignment: .leading, spacing: 32) {
                if let icon = configuration.icon {
                    Image(systemName: icon)
                        .resizable()
                        .frame(maxWidth: 86, maxHeight: 86)
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    if let title = configuration.title {
                        Text(title)
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    Text(configuration.content)
                        .font(.headline)
                        .fontWeight(.semibold)
                } // VStack
                
                HStack(spacing: 16) {
                    configuration.buttonConfigurations.buttons
                        .buttonStyle(buttonStyle)
                } // HStack
            } // VStack
            .padding(.horizontal, 32)
        } // ZStack
        .ignoresSafeArea()
    }
}

extension SnackbarStyle where Self == FullscreenSnackbarStyle {
    public static var fullscreen: Self { .init() }
}
