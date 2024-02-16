//
//  FrostedGlassView.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

struct FrostedGlassView: UIViewRepresentable {
    let blurStyle: UIBlurEffect.Style
    
    init(blurStyle: UIBlurEffect.Style = .prominent) {
        self.blurStyle = blurStyle
    }
    
    func makeUIView(context: Context) -> some UIView {
        UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let uiView = uiView as? UIVisualEffectView else { return }
        uiView.effect = UIBlurEffect(style: blurStyle)
    }
}
