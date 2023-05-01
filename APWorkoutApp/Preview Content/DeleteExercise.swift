//
//  DeleteExercise.swift
//  APWorkoutApp
//
//  Created by Zeead Sowelam23 on 4/28/23.
//

import Foundation
import SwiftUI
class DeleteExercise : ObservableObject{
    @Published var exercises : [Exercise] = [Exercise(name: "Bench", sets: 5, reps: 10, weight: 155)]
    func delete( offsets: IndexSet) {
        exercises.remove(atOffsets: offsets)
    }
}

