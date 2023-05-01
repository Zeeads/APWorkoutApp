//
//  EditExercise.swift
//  APWorkoutApp
//
//  Created by Zeead Sowelam23 on 4/28/23.
//

import SwiftUI
import Foundation
struct EditExerciseView: View {
    var deleteExercise : DeleteExercise
    @Binding var exercises : [Exercise]
    @Binding var editWorkout : Exercise
    @State private var editName = ""
    @State private var editSets = ""
    @State private var editReps = ""
    @State private var editWeight = ""
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Update Exercise Details")) {
                    TextField("Exercise Name", text: $editName)
                    TextField("Sets", text: $editSets)
                        .keyboardType(.numberPad)
                    TextField("Reps", text: $editReps)
                        .keyboardType(.numberPad)
                    TextField("Weight", text: $editWeight)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitle(Text("Edit Exercise"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if let index = self.deleteExercise.exercises.firstIndex(where: {$0.id == editWorkout.id}) {
                    
                    self.deleteExercise.exercises[index].name = self.editName
                    self.deleteExercise.exercises[index].sets = Int(self.editSets)!
                    self.deleteExercise.exercises[index].reps = Int(self.editReps)!
                    self.deleteExercise.exercises[index].weight = Int(self.editWeight)!

                }
                //this takes ueser back to tripview screen after editing trip details
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear{
                //resets the variables to the new ones entered in by the user or keeps them as the same as they orriginaly were if no change
                editName = editWorkout.name
                editSets = String(editWorkout.sets)
                editReps  = String(editWorkout.reps)
                editWeight = String(editWorkout.weight)
                
            }
            
        }
    }
}

