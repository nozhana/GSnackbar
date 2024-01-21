//
//  SnackbarModifier.swift
//  
//
//  Created by Nozhan Amiri on 1/20/24.
//

import SwiftUI

struct SnackbarModifier: ViewModifier {
    @Binding var visible: Bool
    let data: SnackbarData
    
    @State private var task: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        ZStack(alignment: data.position.alignment) {
            content
            if visible {
                Snackbar(data: data)
                    .padding()
                    .animation(.easeInOut, value: 1.2)
                    .transition(data.transition)
                    .onTapGesture {
                        guard case .flash = data.duration else { return }
                        withAnimation {
                            self.visible = false
                        }
                    }
                    .onAppear {
                        guard case .flash = data.duration else { return }
                        
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


public extension View {
    func snackbar(_ visible: Binding<Bool>, data: SnackbarData) -> some View {
        modifier(SnackbarModifier(visible: visible, data: data))
    }
}
