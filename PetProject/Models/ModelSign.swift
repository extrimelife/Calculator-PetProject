//
//  ModelSign.swift
//  PetProject
//
//  Created by roman Khilchenko on 07.03.2023.
//

import Foundation

struct Sign {
    let result: String
    let zero: String
    let one: String
    let two: String
    let three: String
    let four: String
    let five: String
    let six: String
    let seven: String
    let eight: String
    let nine: String
    let reset: String
    let negativ: String
    let percent: String
    let divide: String
    let multiply: String
    let minus: String
    let plus: String
    let equal: String
    let dot: String
}

extension Sign {
    
    static func getSignModel() -> Sign {
        Sign(result: "0", zero: "0", one: "1", two: "2", three: "3",
             four: "4", five: "5", six: "6", seven: "7", eight: "8",
             nine: "9", reset: "C", negativ: "⁺∕₋", percent: "%", divide: "÷",
             multiply: "×", minus: "-", plus: "+", equal: "=", dot: ".")
    }
}
