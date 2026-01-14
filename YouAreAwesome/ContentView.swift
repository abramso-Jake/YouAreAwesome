//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jake Abramson on 1/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I am a Programmer!"
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Button("Click Me!") {
                message = "Awesome!"
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
