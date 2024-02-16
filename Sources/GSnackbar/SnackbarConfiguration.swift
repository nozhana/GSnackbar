//
//  SnackbarConfiguration.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

public struct SnackbarConfiguration {
    public let content: String
    public let title: String?
    public let icon: String?
    public let role: SnackbarRole?
    public let position: SnackbarPosition
    public let buttonConfigurations: [ButtonConfiguration]
    // TODO: buttons
    
    public init(content: String, title: String? = nil, icon: String? = nil, role: SnackbarRole? = nil, position: SnackbarPosition = .top, buttons buttonConfigurations: [ButtonConfiguration] = []) {
        self.content = content
        self.title = title
        self.icon = icon
        self.role = role
        self.position = position
        self.buttonConfigurations = buttonConfigurations
    }
}

public enum SnackbarRole: String, CaseIterable {
    case informative, warning, failure, success
    
    public var color: Color {
        switch self {
        case .informative:
            return .cyan
        case .warning:
            return .orange
        case .failure:
            return .red
        case .success:
            return .green
        }
    }
}

public enum SnackbarPosition: String, CaseIterable {
    case top, center, bottom
    
    public var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        }
    }
}
