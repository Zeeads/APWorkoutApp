//
//  MaxRepFunc.swift
//  APWorkoutApp
//
//  Created by Zeead Sowelam23 on 5/17/23.
//

import Foundation
private var exerciseTypes = [
    "Squat",
    "Deadlift",
    "Clean",
    "Incline Bench"
]
func maxes(max : Double) -> [Double] {
    var maxes: [Double] = []
    for index in 0...(exerciseTypes.count - 1){
        var max : Double = max
        if exerciseTypes[index] == "Squat" {
            max = 1.33 * max
        }
        else if exerciseTypes[index] == "Deadlift" {
            max = 1.67 * max
        }
        else if exerciseTypes[index] == "Clean" {
            max = 0.8 * max
        }
        else if exerciseTypes[index] == "Incline Bench" {
            max = 0.85 * max
        }
        maxes.append(max)
    }
    return maxes
}
