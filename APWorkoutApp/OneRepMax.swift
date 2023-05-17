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

