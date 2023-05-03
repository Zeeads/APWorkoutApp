//
//  AddExerciseView.swift
//  APWorkoutApp
//

import SwiftUI

struct AddExerciseView: View {
    var deleteExercise : DeleteExercise
    @Binding var exercises: [Exercise] 
    @State private var name = ""
    @State private var sets = ""
    @State private var reps = ""
    @State private var weight = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Exercise Details")) {
                    TextField("Exercise Name", text: $name)
                    TextField("Sets", text: $sets)
                        .keyboardType(.numberPad)
                    TextField("Reps", text: $reps)
                        .keyboardType(.numberPad)
                    TextField("Weight", text: $weight)
                        .keyboardType(.numberPad)
                }
                Section {
                    Button(action: {
                        let newExercise = Exercise(name: self.name, sets: Int(self.sets) ?? 0, reps: Int(self.reps) ?? 0, weight: Int(self.weight) ?? 0)
                        self.deleteExercise.exercises.append(newExercise)
                        self.name = ""
                        self.sets = ""
                        self.reps = ""
                        self.weight = ""
                        
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save Exercise")
                    }
                }
            }
            .navigationBarTitle(Text("New Exercise"), displayMode: .inline)
        }
    }
}

