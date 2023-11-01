//
//  ContentView.swift
//  Checkity
//
//  Created by Anna Wu on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10,15,20,25,0]
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let total = tipValue + checkAmount
        
        return total
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let total = tipValue + checkAmount
        let amountPerPerson = total / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter check total and number of people:"){
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad).focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<50){
                            Text("\($0) people")
                        }
                    }
                }
                Section("Select Tip Amount:"){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total:"){
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount per person:"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("Checkity")
            .toolbar {
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// PRACTICE!!!
//
//import SwiftUI
//
//struct ContentView: View {
//    //@State var tapCount = 0
//    @State private var name = ""
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
//    
//    var body: some View {
//        //        VStack {
//        //            Text("Split!")
//        //        }
//        //        .padding()
//        NavigationStack{
//            Form {
//                //                Section{
//                //                    TextField("Enter your name", text: $name)
//                //                    Text("Your name is \(name)")
//                //                }
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .navigationTitle("SwiftUI")
//                .navigationBarTitleDisplayMode(.inline)
//            }
//            
//            //        Button("Tap Count: \(tapCount)") {
//            //            tapCount += 1
//            //        }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
