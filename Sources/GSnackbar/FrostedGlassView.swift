//
//  FrostedGlassView.swift
//  
//
//  Created by Nozhan Amiri on 1/21/24.
//

import SwiftUI

struct FrostedGlassView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView { UIVisualEffectView(effect: UIBlurEffect(style: .light)) }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let uiView = uiView as? UIVisualEffectView else { return }
        uiView.effect = UIBlurEffect(style: .light)
    }
}
