//
//  SnackbarData.swift
//  
//
//  Created by Nozhan Amiri on 1/20/24.
//

import SwiftUI

public struct SnackbarData: Equatable {
    public var title: String
    public var description: String
    public var buttons: [SnackbarButton] = []
}

