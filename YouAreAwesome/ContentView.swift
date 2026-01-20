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
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
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
                var messageNum: Int
                repeat{
                    messageNum = Int.random(in: 0...messages.count-1)
                }  while (lastMessageNumber == messageNum)
                message = messages[messageNum]
                lastMessageNumber = messageNum
                
                var imageNum: Int
                repeat{
                    imageNum = Int.random(in: 0...9)
                } while(lastImageNumber == imageNum)
                imageName = "image\(imageNum)"
                lastImageNumber = imageNum
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
