//
//  File.swift
//  
//
//  Created by Nozhan Amiri on 1/29/24.
//

import SwiftUI

public struct ButtonConfiguration: Identifiable {
    public let id = UUID()
    public let title: String
    public let role: ButtonRole?
    public let action: () -> Void
    
    public init(_ title: String, role: ButtonRole? = nil, action: @escaping () -> Void) {
        self.title = title
        self.role = role
        self.action = action
    }
}

extension ButtonConfiguration {
    @ViewBuilder
    public var button: some View {
        Button(title, role: role, action: action)
    }
}

extension [ButtonConfiguration] {
    @ViewBuilder
    public var buttons: some View {
        ForEach(self, id: \.id) { configuration in
            configuration.button
        }
    }
}
