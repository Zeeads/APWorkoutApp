//
//  OneRepMax.swift
//  APWorkoutApp
//
//  Created by Zeead Sowelam23 on 4/17/23.
//

import SwiftUI

struct OneRepMaxView: View {
    @State private var weight = ""
    @State private var reps = ""
    @State private var maxesList:[Double] = []

    private var exerciseTypes = [
        "Squat",
        "Deadlift"
    ]

    var oneRepMax: Double {
        guard let weight = Double(weight), let reps = Double(reps), reps > 0 else {
            return 0
        }

        return weight * (1 + reps / 30)
    }
    
    func maxes(max : Double) -> [Double] {
        var maxes: [Double] = []
        
        var max : Double = 0
        for index in 0...1{
            if exerciseTypes[index] == "Squat" {
                max = 1.3 * max
            }
            else if exerciseTypes[index] == "Deadlift" {
                max = 2 * max
            }
            
            maxes.append(max)
        }
        
        return maxes
    }


    var body: some View {
        VStack {
            TextField("Weight (lbs)", text: $weight)
                .keyboardType(.numberPad)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

            TextField("Reps", text: $reps)
                .keyboardType(.numberPad)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

            Text("One Rep Bench Max: \(oneRepMax) lbs")
                .font(.headline)
                .padding(.top, 20)
                
            Button(action: {
                maxesList = maxes(max: self.oneRepMax)
                
            }) {
                Text("Calculate Maxes")
            }
            
            List{
                ForEach(0...1, id: \.self){ i in
                    Text("\(exerciseTypes[i]) Max : \(maxesList[i])")
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Bench Press Calculator")
    }
}


struct OneRepMaxView_Previews: PreviewProvider {
    static var previews: some View {
        OneRepMaxView()
    }
}
            
//Squat max = Bench max * 1.33
//Deadlift max = Bench max * 1.66
