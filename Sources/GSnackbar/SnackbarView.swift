//
//  SnackbarView.swift
//
//
//  Created by Nozhan Amiri on 1/27/24.
//

import SwiftUI

struct SnackbarView<Style>: View where Style: SnackbarStyle {
    let style: Style
    let configuration: Style.Configuration
    
    init(_ configuration: Style.Configuration, style: Style) {
        self.style = style
        self.configuration = configuration
    }
    
    var body: some View {
        self.style.makeBody(configuration: self.configuration)
    }
}

extension SnackbarView where Style == DefaultSnackbarStyle {
    init(_ configuration: Style.Configuration) {
        self.style = DefaultSnackbarStyle()
        self.configuration = configuration
    }
}

#Preview("Default") {
    ZStack {
        HStack {
            Color.blue
            Color.brown
            Color.red
            Color.green
            Color.white
            Color.black
            Color.yellow
            Color.pink
            Color.orange
            Color.purple
        }
        .ignoresSafeArea()
        
        ScrollView {
            SnackbarView(.init(
                content: "Please continue to Profile settings to complete your registration process.",
                title: "Welcome to PongMaster!",
                icon: "party.popper", buttons: [
                    .init("Apply") {},
                    .init("Cancel", role: .cancel) {}
                ]))
            ForEach(SnackbarRole.allCases, id: \.rawValue) { role in
                SnackbarView(.init(content: "Please continue to Profile settings to complete your registration process.", title: "Welcome to PongMaster!", icon: "party.popper", role: role))
            }
        }
    }
}

#Preview("Frosted") {
    ZStack {
        HStack {
            Color.blue
            Color.brown
            Color.red
            Color.green
            Color.white
            Color.black
            Color.yellow
            Color.pink
            Color.orange
            Color.purple
        }
        .ignoresSafeArea()
        
        ScrollView {
            SnackbarView(.init(content: "Please continue to Profile settings to complete your registration process.", title: "Welcome to PongMaster!", icon: "party.popper", buttons: [
                .init("Apply") {},
                .init("Delete", role: .destructive) {}
            ]), style: .frosted)
            ForEach(SnackbarRole.allCases, id: \.rawValue) { role in
                SnackbarView(.init(content: "Please continue to Profile settings to complete your registration process.", title: "Welcome to PongMaster!", icon: "party.popper", role: role, buttons: [
                    .init("OK", role: .cancel) {}
                ]), style: .frosted)
            }
        }
    }
}

#Preview("Figma") {
    ZStack {
        HStack {
            Color.blue
            Color.brown
            Color.red
            Color.green
            Color.white
            Color.black
            Color.yellow
            Color.pink
            Color.orange
            Color.purple
        }
        .ignoresSafeArea()
        
        ScrollView {
            SnackbarView(.init(content: "Please continue to Profile settings to complete your registration process.", title: "Welcome to PongMaster!", icon: "party.popper", buttons: [
                .init("Apply") {},
                .init("Cancel", role: .cancel) {}
            ]), style: .figma)
            ForEach(SnackbarRole.allCases, id: \.rawValue) { role in
                SnackbarView(.init(content: "Please continue to Profile settings to complete your registration process.", title: "Welcome to PongMaster!", icon: "party.popper", role: role, buttons: [
                    .init("Delete", role: .destructive) {},
                    .init("Continue", role: .cancel) {}
                ]), style: .figma)
            }
        }
    }
}

#Preview("Fullscreen") {
    ZStack {
        HStack {
            Color.blue
            Color.brown
            Color.red
            Color.green
            Color.white
            Color.black
            Color.yellow
            Color.pink
            Color.orange
            Color.purple
        }
        SnackbarView(.init(content: "Please continue to Profile settings to complete your registration process.", title: "Welcome to PongMaster!", icon: "party.popper", buttons: [
            .init("Cancel", role: .cancel, action: {}),
            .init("Okay", action: {})
        ]), style: .fullscreen)
    }
}
