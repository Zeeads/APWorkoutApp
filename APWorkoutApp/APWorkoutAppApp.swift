//
//  APWorkoutAppApp.swift
//  APWorkoutApp
//
//  Created by Zeead Sowelam23 on 3/15/23.
//

import SwiftUI

@main
struct APWorkoutAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                        List {
                            NavigationLink(destination: OneRepMaxView()) {
                                Text("Calculate One Rep Max")
                            }
                        }
                        .navigationTitle("Gym App")
                    }
        }
    }
}
