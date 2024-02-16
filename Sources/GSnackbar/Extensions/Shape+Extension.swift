//
//  File.swift
//  
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

extension Shape where Self == RoundedRectangle {    
    static func roundedRect(_ cornerRadius: CGFloat = 8) -> RoundedRectangle {
        .init(cornerSize: CGSize(width: cornerRadius, height: cornerRadius), style: .continuous)
    }
}
