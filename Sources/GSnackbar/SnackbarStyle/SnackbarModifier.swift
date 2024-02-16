//
//  SnackbarModifier.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

struct SnackbarModifier<Style>: ViewModifier where Style: SnackbarStyle {
    @Binding var visible: Bool
    private let configuration: SnackbarConfiguration
    private let style: Style
    
    @State private var task: DispatchWorkItem?
    
    init(_ visible: Binding<Bool>, configuration: SnackbarConfiguration, style: Style) {
        self._visible = visible
        self.configuration = configuration
        self.style = style
        self.task = task
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: configuration.position.alignment) {
            content
            if visible {
                SnackbarView(configuration)
                    .snackbarStyle(style)
                    .animation(.spring)
                    .transition(style.transition(forPosition: configuration.position))
                    .onTapGesture {
                        // TODO: add action
                        withAnimation {
                            self.visible = false
                        }
                        self.task?.cancel()
                    }
                    .onAppear {
                        self.task = DispatchWorkItem {
                            withAnimation {
                                self.visible = false
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: self.task!)
                    }
                    .onDisappear {
                        self.task?.cancel()
                    }
            }
        }
    }
}


extension View {
    public func snackbar<Style>(_ visible: Binding<Bool>, configuration: SnackbarConfiguration, style: Style) -> some View where Style: SnackbarStyle {
        modifier(SnackbarModifier(visible, configuration: configuration, style: style))
    }
    
    public func snackbar(_ visible: Binding<Bool>, configuration: SnackbarConfiguration) -> some View {
        modifier(SnackbarModifier(visible, configuration: configuration, style: .default))
    }
}
