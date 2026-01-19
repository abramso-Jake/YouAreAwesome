//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jake Abramson on 1/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var messageNum = 0
    @State private var imageName = ""
    @State private var imageNumber = 0
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
                let messages = ["You are Awesome!", "When the Genius Bar Needs Help, They Call You!", "You are Great!", "Fabulous? That's You", "Keep it up!", "You Make Me Smile"]
                message = messages[messageNum]
                messageNum += 1
                if messageNum == messages.count{
                    messageNum = 0
                }
                imageName = "image\(imageNumber)"
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
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
