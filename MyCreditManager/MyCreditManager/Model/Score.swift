//
//  Score.swift
//  MyCreditManager
//
//  Created by 김영선 on 2023/03/26.
//

import Foundation

enum Score: Double, CaseIterable {
    case A_plus = 4.5
    case A = 4.0
    case B_plus = 3.5
    case B = 3.0
    case C_plus = 2.5
    case C = 2.0
    case D_plus = 1.5
    case D = 1.0
    case F = 0.0

    var description : String {
        switch self {
        case .A_plus: return "A+"
        case .A: return "A"
        case .B_plus: return "B+"
        case .B: return "B"
        case .C_plus: return "C+"
        case .C: return "C"
        case .D_plus: return "D+"
        case .D: return "D"
        case .F: return "F"
        }
    }

    init?(description: String) {
        switch description {
        case "A+": self = .A_plus
        case "A":  self = .A
        case "B+": self = .B_plus
        case "B":  self = .B
        case "C+": self = .C_plus
        case "C":  self = .C
        case "D+": self = .D_plus
        case "D":  self = .D
        case "F":  self = .F
        default:   return nil
        }
    }
}
