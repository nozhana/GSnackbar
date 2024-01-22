//
//  Color+Extension.swift
//
//
//  Created by Nozhan Amiri on 1/21/24.
//

import SwiftUI

extension Color {
    init(light: Color, dark: Color) {
        self.init(uiColor: UIColor(light: UIColor(light), dark: UIColor(dark)))
    }
    
    static func blend(_ color1: Color, _ color2: Color, intensity: (color1: CGFloat, color2: CGFloat) = (0.5, 0.5)) -> Self {
        guard intensity.color1.between(0.0, 1.0),
              intensity.color2.between(0.0, 1.0) else {
            fatalError("Color intensity invalid - Should be between 0.0 and 1.0")
        }
        
        let total = intensity.color1 + intensity.color2
        
        let i1 = intensity.color1 / total
        let i2 = intensity.color2 / total
        
        let components1 = color1.cgColor!.components!
        let components2 = color2.cgColor!.components!
        
        let (r1, g1, b1, a1) = (components1[0], components1[1], components1[2], components1[3])
        let (r2, g2, b2, a2) = (components2[0], components2[1], components2[2], components2[3])
        
        return Color(.sRGBLinear,
                     red: i1 * r1 + i2 * r2,
                     green: i1 * g1 + i2 * g2,
                     blue: i1 * b1 + i2 * b2,
                     opacity: i1 * a1 + i2 * a2)
        
    }
    
    // MARK: - Colors
    public static var snackbarInfo: Color {
        .init(light: Color(red: 0, green: 0.991, blue: 1, opacity: 0.2),
              dark: Color(red: 0, green: 0.945, blue: 0.954, opacity: 0.2))
    }
    
    public static var snackbarWarning: Color {
        .init(light: Color(red: 0.999, green: 0.985, blue: 0.134, opacity: 0.2),
              dark: Color(red: 0.982, green: 0.966, blue: 0, opacity: 0.2))
    }
    
    public static var snackbarError: Color {
        .init(light: Color(red: 0.974, green: 0.366, blue: 0.261, opacity: 0.2),
              dark: Color(red: 1, green: 0.149, blue: 0, opacity: 0.2))
    }
    
    public static var snackbarSuccess: Color {
        .init(light: Color(red: 0.451, green: 0.988, blue: 0.838, opacity: 0.25),
              dark: Color(red: 0.451, green: 0.988, blue: 0.838, opacity: 0.25))
    }
    
    public static var snackbarInfoSolid: Color {
        .init(light: Color(red: 0, green: 0.991, blue: 1),
              dark: Color(red: 0, green: 0.945, blue: 0.954))
    }
    
    public static var snackbarWarningSolid: Color {
        .init(light: Color(red: 0.999, green: 0.985, blue: 0.134),
              dark: Color(red: 0.982, green: 0.966, blue: 0))
    }
    
    public static var snackbarErrorSolid: Color {
        .init(light: Color(red: 0.974, green: 0.366, blue: 0.261),
              dark: Color(red: 1, green: 0.149, blue: 0))
    }
    
    public static var snackbarSuccessSolid: Color {
        .init(light: Color(red: 0.451, green: 0.988, blue: 0.838),
              dark: Color(red: 0.451, green: 0.988, blue: 0.838))
    }
}

extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }
}
