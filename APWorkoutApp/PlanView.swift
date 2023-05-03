//
//  PlanView.swift
//  APWorkoutApp
//

import SwiftUI

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var sets: Int
    var reps: Int
    var weight: Int
}

struct PlanView: View {
    
    @State var exercises : [Exercise] = [Exercise(name: "Bench", sets: 5, reps: 10, weight: 155)]
    
    @State var showAddExerciseView = false
    @State var showEditExerciseView = false
    @State var editingExercise : Exercise = Exercise(name: "Bench", sets: 5, reps: 10, weight: 155)
    @State var dayOfWeek = "Workouts"
    @ObservedObject var deleteExercise = DeleteExercise()
    
    var body: some View {
        NavigationView{
            VStack {
                Text(dayOfWeek)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
               VStack{
                   //This is where I render in the information for each exercise in the list
                   
                    List{
                        ForEach(deleteExercise.exercises) { exercise in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(exercise.name)
                                        .font(.headline)
                                    Text("Sets: \(exercise.sets) Reps: \(exercise.reps) Weight: \(exercise.weight)")
                                        .font(.subheadline)
                                }
                                
                                
                                Spacer()
                                //Buttons for each exercise in the list
                                Button(action: {
                                    self.showEditExerciseView = true
                                    self.editingExercise = exercise
                                }) {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.blue)
                                }
                                
                            }
                            
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        } .onDelete(perform: deleteExercise.delete)
                        
                    }
                    }.padding()
                    .toolbar{
                        ToolbarItemGroup{
                            EditButton()
                            Button(action: {
                                self.showAddExerciseView = true
                            }) {
                                Text("Add Exercise")
                            }
                            .padding()
                            .sheet(isPresented: $showAddExerciseView) {
                                AddExerciseView(deleteExercise: deleteExercise, exercises: self.$exercises)
                                
                            } .sheet(isPresented: $showEditExerciseView) {
                                EditExerciseView(deleteExercise: deleteExercise, exercises: self.$exercises, editWorkout: self.$editingExercise)
                            }
                        }
                        
                    }

                }
            }
        }
    }



struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
