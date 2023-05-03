//
//  ContentView.swift
//  APWorkoutApp
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationView {
                List {
                    NavigationLink(destination: OneRepMaxView()) {
                        Text("Calculate One Rep Max")
                    }
                    NavigationLink(destination: PlanView()) {
                        Text("Workout Schedule")
                    }
                }
                .navigationTitle("Gym App")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
