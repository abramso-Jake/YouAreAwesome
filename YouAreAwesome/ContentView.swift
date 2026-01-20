//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jake Abramson on 1/9/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10
    let numberOfSounds = 6
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
            Spacer()
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
                    imageNum = Int.random(in: 0...numberOfImages-1)
                } while(lastImageNumber == imageNum)
                imageName = "image\(imageNum)"
                lastImageNumber = imageNum
                
                var soundNum: Int
                repeat{
                    soundNum = Int.random(in: 0...numberOfSounds-1)
                } while(lastSoundNumber == soundNum)
                lastSoundNumber = soundNum
                let soundName = "sound\(soundNum)"
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch{
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
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
