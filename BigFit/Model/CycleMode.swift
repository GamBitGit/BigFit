//
//  TrainingMode.swift
//  BigFit
//
//  Created by Владислав on 07.01.2021.
//

import Foundation

enum CycleMode: String, CaseIterable {
    case low = "Силовой 2-6"
    case mid = "Средний 6-10"
    case high = "Многоповтор 8-15"
    
    func min() -> Int {
        switch self {
        case .low:
            return 2
        case .mid:
            return 6
        case .high:
            return 8
        }
    }
    
    func max() -> Int {
        switch self {
        case .low:
            return 6
        case .mid:
            return 10
        case .high:
            return 15
        }
    }
    
}
