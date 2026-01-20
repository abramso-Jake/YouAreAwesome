//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jake Abramson on 1/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration:0.15), value:imageName)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value:imageName)
            Spacer()
            Button("Show Message") {
                let messages = ["You are Awesome!", "When the Genius Bar Needs Help, They Call You!", "You are Great!", "You Are Fantastic!", "Fabulous? That's You", "Keep it up!", "You Make Me Smile"]
                message = messages[Int.random(in: 0...messages.count-1)]
                
                imageName = "image\(Int.random(in: 0...9))"
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
