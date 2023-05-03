//
//  OneRepMax.swift
//  APWorkoutApp
//


import SwiftUI

struct OneRepMaxView: View {
    @State private var weight = ""
    @State private var reps = ""

    private var exerciseTypes = [
        "Squat",
        "Deadlift",
        "Clean",
        "Incline Bench"
    ]

    var oneRepMax: Double {
        guard let weight = Double(weight), let reps = Double(reps), reps > 0 else {
            return 0
        }

        return weight * (1 + (reps - 1) / 30)
    }
    
    var maxesList : [Double] {
        return maxes(max: oneRepMax)
    }
    
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
            
            List{
                ForEach(0...(exerciseTypes.count - 1), id: \.self){ i in
                   Text("\(exerciseTypes[i]) Max : \(maxesList[i]) lbs")
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("One Rep Max")
    }
}


struct OneRepMaxView_Previews: PreviewProvider {
    static var previews: some View {
        OneRepMaxView()
    }
}

