//
//  ContentView.swift
//  Checkity
//
//  Created by Anna Wu on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    //@State var tapCount = 0
    @State private var name = ""
    var body: some View {
//        VStack {
//            Text("Split!")
//        }
//        .padding()
        NavigationStack{
            Form {
                Section{
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
    }
}

#Preview {
    ContentView()
}
