//
//  ExerciseRowView.swift
//  APWorkoutApp
//
//  Created by Zeead Sowelam23 on 4/28/23.
//

import SwiftUI

struct ExerciseRowView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
            Text("Sets: \(exercise.sets), Reps: \(exercise.reps), Weight: \(exercise.weight)")
        }
    }
}

struct ExerciseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRowView()
    }
}
