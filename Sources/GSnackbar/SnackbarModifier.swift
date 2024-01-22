//
//  SnackbarModifier.swift
//  
//
//  Created by Nozhan Amiri on 1/20/24.
//

import SwiftUI

public struct SnackbarModifier: ViewModifier {
    @Binding public var visible: Bool
    public let data: SnackbarData
    public let style: SnackbarStyle
    
    @State private var task: DispatchWorkItem?
    
    public func body(content: Content) -> some View {
        ZStack(alignment: style.position.alignment) {
            content
            if visible {
                Snackbar(data: data, style: style)
                    .padding()
                    .animation(.easeInOut, value: 1.2)
                    .transition(style.transition)
                    .onTapGesture {
                        guard case .flash = style.duration else { return }
                        withAnimation {
                            self.visible = false
                        }
                    }
                    .onAppear {
                        guard case .flash = style.duration else { return }
                        
                        self.task = DispatchWorkItem {
                            withAnimation {
                                self.visible = false
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: self.task!)
                    }
                    .onDisappear {
                        self.task?.cancel()
                    }
            }
        }
    }
}


extension View {
    public func snackbar<S>(_ visible: Binding<Bool>, data: SnackbarData, style: S) -> some View where S: SnackbarStyle {
        modifier(SnackbarModifier(visible: visible, data: data, style: style))
    }
}
