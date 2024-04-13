//
//  PlayerView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel = PlayerViewModel()
    @Environment(\.presentationMode) var presentationMode

    var sound:Sound
    var meditation:Meditation
    
    var body: some View {
        
        VStack{
            Text(meditation.name)
            Text(sound.sound)
            Button {
                viewModel.uploadTweet(withCaption: sound.sound, withAlbum: meditation.name)
           
             //   viewModel.didUploadScore()
              viewModel.addPointsToScore(withScore: 10)
            } label: {
                Text("Terminer")
            }
        }.onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
            
            
        }
    }
}

#Preview {
    PlayerView(sound: Sound(sound: "Sound1", time: "10:00", file: "intro.mp3"), meditation: Meditation(name: "Mountain", image: "", sounds: [Sound(sound: "sound1", time: "10:00", file: "")], isSelected: true))
}
