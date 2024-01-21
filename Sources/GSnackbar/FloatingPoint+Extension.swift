//
//  FloatingPoint+Extension.swift
//  
//
//  Created by Nozhan Amiri on 1/21/24.
//

import Foundation

extension FloatingPoint {
    func between(_ lhs: Self, _ rhs: Self, includeLowerBound: Bool = true, includeUpperBound: Bool = true) -> Bool {
        switch (includeLowerBound, includeUpperBound) {
        case (true, true):
            return lhs <= self && self <= rhs
        case (true, false):
            return lhs <= self && self < rhs
        case (false, true):
            return lhs < self && self <= rhs
        case (false, false):
            return lhs < self && self < rhs
        }
    }
}
